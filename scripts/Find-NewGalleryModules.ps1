<#
.SYNOPSIS
    Lists modules first published to the PowerShell Gallery within a given age window that aren't already in README.md, for review as candidates to add to the list.
.DESCRIPTION
    Queries the PowerShell Gallery OData feed directly (no PowerShellGet/PSResourceGet dependency) to find any module
    version created between MaxAgeDays and MinAgeDays ago, then for each not-already-known module confirms its
    earliest-ever version also falls in that window - so a module doesn't dodge the window just because it keeps
    shipping new versions faster than the window is wide. That confirmation costs two small, single-page Gallery
    requests per not-already-known candidate. Known modules (already in README.md) are excluded before that lookup,
    so the extra cost only applies to genuinely new candidates.

    The default 30-37 day window is intended to give a new module a little time to mature before it's reviewed,
    while still catching it within the next weekly run.
.PARAMETER MinAgeDays
    Minimum age in days of the module's first-ever published version. Default 30.
.PARAMETER MaxAgeDays
    Maximum age in days of the module's first-ever published version. Default 37.
.PARAMETER Path
    Path to the README.md file used to exclude modules already on the list.
.EXAMPLE
    ./Find-NewGalleryModules.ps1 | Format-Table Name, FirstPublished, ProjectUrl
.EXAMPLE
    ./Find-NewGalleryModules.ps1 -MinAgeDays 30 -MaxAgeDays 37 | Sort-Object Downloads -Descending
#>
[CmdletBinding()]
param(
    [int]$MinAgeDays = 30,
    [int]$MaxAgeDays = 37,
    [string]$Path = (Join-Path $PSScriptRoot '..' 'README.md')
)

function Get-NormalizedName {
    param([string]$Name)
    ($Name -replace '[^A-Za-z0-9]', '').ToLowerInvariant()
}

function ConvertTo-ODataString {
    param([string]$Value)
    $Value -replace "'", "''"
}

$ns = @{
    a = 'http://www.w3.org/2005/Atom'
    d = 'http://schemas.microsoft.com/ado/2007/08/dataservices'
    m = 'http://schemas.microsoft.com/ado/2007/08/dataservices/metadata'
}

function Get-GalleryFeedEntries {
    param(
        [string]$Uri,
        [switch]$SinglePage
    )

    $entries = [System.Collections.Generic.List[pscustomobject]]::new()
    while ($Uri) {
        $response = Invoke-WebRequest -Uri $Uri -ErrorAction Stop
        [xml]$feed = $response.Content

        $nsMgr = [System.Xml.XmlNamespaceManager]::new($feed.NameTable)
        foreach ($key in $ns.Keys) { $nsMgr.AddNamespace($key, $ns[$key]) }

        foreach ($entry in (Select-Xml -Xml $feed -Namespace $ns -XPath '//a:entry').Node) {
            $props = $entry.SelectSingleNode('m:properties', $nsMgr)
            $entries.Add([PSCustomObject]@{
                Id              = $props.SelectSingleNode('d:Id', $nsMgr).InnerText
                ProjectUrl      = $props.SelectSingleNode('d:ProjectUrl', $nsMgr).InnerText
                Author          = $props.SelectSingleNode('d:Authors', $nsMgr).InnerText
                Created         = [datetime]$props.SelectSingleNode('d:Created', $nsMgr).InnerText
                Published       = [datetime]$props.SelectSingleNode('d:Published', $nsMgr).InnerText
                Downloads       = [int]$props.SelectSingleNode('d:DownloadCount', $nsMgr).InnerText
                Description     = $props.SelectSingleNode('d:Description', $nsMgr).InnerText
                IsLatestVersion = $props.SelectSingleNode('d:IsLatestVersion', $nsMgr).InnerText -eq 'true'
            })
        }

        if ($SinglePage) {
            break
        }

        $nextLink = Select-Xml -Xml $feed -Namespace $ns -XPath '//a:link[@rel="next"]/@href'
        $Uri = if ($nextLink) { $nextLink.Node.Value } else { $null }
    }
    $entries
}

$content = Get-Content -Path $Path -Raw
$entryPattern = '(?m)^- \[(?<Name>[^\]]+)\]\((?<Url>[^)]+)\) - .+$'
$knownNames = [System.Collections.Generic.HashSet[string]]::new()
foreach ($entryMatch in [regex]::Matches($content, $entryPattern)) {
    [void]$knownNames.Add((Get-NormalizedName $entryMatch.Groups['Name'].Value))
    if ($entryMatch.Groups['Url'].Value -match 'powershellgallery\.com/packages/(?<Id>[^/?#]+)') {
        [void]$knownNames.Add((Get-NormalizedName $Matches.Id))
    }
}

$fromDate = (Get-Date).ToUniversalTime().AddDays(-$MaxAgeDays)
$toDate = (Get-Date).ToUniversalTime().AddDays(-$MinAgeDays)
$fromDateLiteral = $fromDate.ToString('yyyy-MM-ddTHH:mm:ssZ')
$toDateLiteral = $toDate.ToString('yyyy-MM-ddTHH:mm:ssZ')

# Broad net: any version (not just the latest) created in the window, so a module that has since shipped
# further versions - pushing its latest Published date outside the window - is still caught here.
$filter = "Created gt datetime'$fromDateLiteral' and Created lt datetime'$toDateLiteral' and substringof('PSModule',Tags)"
$uri = "https://www.powershellgallery.com/api/v2/Packages()?`$filter=$filter&`$orderby=Created desc"

$candidateIds = Get-GalleryFeedEntries -Uri $uri |
    Select-Object -ExpandProperty Id -Unique |
    Where-Object { -not $knownNames.Contains((Get-NormalizedName $_)) }

$results = [System.Collections.Generic.List[pscustomobject]]::new()
foreach ($id in $candidateIds) {
    $idLiteral = ConvertTo-ODataString $id

    # Single-page, ascending: the first entry is the module's earliest-ever version. Capped to one page so a
    # module with a long version history doesn't drag its whole history over the wire just to read one date.
    $earliestUri = "https://www.powershellgallery.com/api/v2/Packages()?`$filter=Id eq '$idLiteral'&`$orderby=Created asc"
    $earliest = Get-GalleryFeedEntries -Uri $earliestUri -SinglePage | Select-Object -First 1
    if (-not $earliest) {
        continue
    }

    if ($earliest.Created -lt $fromDate -or $earliest.Created -gt $toDate) {
        # Not actually new - just another release of a module that already existed before the window.
        continue
    }

    # Exact match on IsLatestVersion returns a single entry - the current stable release's metadata.
    $latestUri = "https://www.powershellgallery.com/api/v2/Packages()?`$filter=Id eq '$idLiteral' and IsLatestVersion eq true"
    $latest = Get-GalleryFeedEntries -Uri $latestUri -SinglePage | Select-Object -First 1
    if (-not $latest) {
        # No stable (non-prerelease) release yet.
        continue
    }

    $galleryUrl = "https://www.powershellgallery.com/packages/$id"
    $results.Add([PSCustomObject]@{
        Name           = $id
        ProjectUrl     = if ($latest.ProjectUrl) { $latest.ProjectUrl } else { $galleryUrl }
        GalleryUrl     = $galleryUrl
        Author         = $latest.Author
        FirstPublished = $earliest.Created
        Published      = $latest.Published
        Downloads      = $latest.Downloads
        Description    = $latest.Description
    })
}

$results | Sort-Object FirstPublished -Descending
