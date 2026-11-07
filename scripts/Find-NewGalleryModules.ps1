<#
.SYNOPSIS
    Lists modules published to the PowerShell Gallery within a given age window that aren't already in README.md, for review as candidates to add to the list.
.DESCRIPTION
    Queries the PowerShell Gallery OData feed directly (no PowerShellGet/PSResourceGet dependency) for modules whose
    latest stable version was published between MaxAgeDays and MinAgeDays ago, then excludes any whose name already
    appears in README.md. The default 30-37 day window is intended to give a new module a little time to mature
    before it's reviewed, while still catching it within the next weekly run.
.PARAMETER MinAgeDays
    Minimum age in days of the module's latest publish date. Default 30.
.PARAMETER MaxAgeDays
    Maximum age in days of the module's latest publish date. Default 37.
.PARAMETER Path
    Path to the README.md file used to exclude modules already on the list.
.EXAMPLE
    ./Find-NewGalleryModules.ps1 | Format-Table Name, Published, ProjectUrl
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

$content = Get-Content -Path $Path -Raw
$entryPattern = '(?m)^- \[(?<Name>[^\]]+)\]\((?<Url>[^)]+)\) - .+$'
$knownNames = [System.Collections.Generic.HashSet[string]]::new()
foreach ($entryMatch in [regex]::Matches($content, $entryPattern)) {
    [void]$knownNames.Add((Get-NormalizedName $entryMatch.Groups['Name'].Value))
    if ($entryMatch.Groups['Url'].Value -match 'powershellgallery\.com/packages/(?<Id>[^/?#]+)') {
        [void]$knownNames.Add((Get-NormalizedName $Matches.Id))
    }
}

$fromDate = (Get-Date).ToUniversalTime().AddDays(-$MaxAgeDays).ToString('yyyy-MM-ddTHH:mm:ssZ')
$toDate = (Get-Date).ToUniversalTime().AddDays(-$MinAgeDays).ToString('yyyy-MM-ddTHH:mm:ssZ')

$filter = "IsLatestVersion eq true and IsPrerelease eq false and Published gt datetime'$fromDate' and Published lt datetime'$toDate' and substringof('PSModule',Tags)"
$uri = "https://www.powershellgallery.com/api/v2/Packages()?`$filter=$filter&`$orderby=Published desc"

$ns = @{
    a = 'http://www.w3.org/2005/Atom'
    d = 'http://schemas.microsoft.com/ado/2007/08/dataservices'
    m = 'http://schemas.microsoft.com/ado/2007/08/dataservices/metadata'
}

$results = [System.Collections.Generic.List[pscustomobject]]::new()
while ($uri) {
    $response = Invoke-WebRequest -Uri $uri -ErrorAction Stop
    [xml]$feed = $response.Content

    $nsMgr = [System.Xml.XmlNamespaceManager]::new($feed.NameTable)
    foreach ($key in $ns.Keys) { $nsMgr.AddNamespace($key, $ns[$key]) }

    foreach ($entry in (Select-Xml -Xml $feed -Namespace $ns -XPath '//a:entry').Node) {
        $props = $entry.SelectSingleNode('m:properties', $nsMgr)
        $id = $props.SelectSingleNode('d:Id', $nsMgr).InnerText
        if ($knownNames.Contains((Get-NormalizedName $id))) {
            continue
        }

        $galleryUrl = "https://www.powershellgallery.com/packages/$id"
        $projectUrl = $props.SelectSingleNode('d:ProjectUrl', $nsMgr).InnerText

        $results.Add([PSCustomObject]@{
            Name        = $id
            ProjectUrl  = if ($projectUrl) { $projectUrl } else { $galleryUrl }
            GalleryUrl  = $galleryUrl
            Author      = $props.SelectSingleNode('d:Authors', $nsMgr).InnerText
            Published   = [datetime]$props.SelectSingleNode('d:Published', $nsMgr).InnerText
            Downloads   = [int]$props.SelectSingleNode('d:DownloadCount', $nsMgr).InnerText
            Description = $props.SelectSingleNode('d:Description', $nsMgr).InnerText
        })
    }

    $nextLink = Select-Xml -Xml $feed -Namespace $ns -XPath '//a:link[@rel="next"]/@href'
    $uri = if ($nextLink) { $nextLink.Node.Value } else { $null }
}

$results | Sort-Object Published -Descending
