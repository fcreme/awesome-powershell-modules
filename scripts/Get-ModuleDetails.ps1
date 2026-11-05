<#
.SYNOPSIS
    Lists every module in README.md along with its name, URL, PowerShell Gallery author, and download count.
.PARAMETER Path
    Path to the README.md file to parse.
.EXAMPLE
    ./Get-ModuleDetails.ps1 | Format-Table
.EXAMPLE
    ./Get-ModuleDetails.ps1 | Export-Csv ./modules.csv -NoTypeInformation
#>
[CmdletBinding()]
param(
    [string]$Path = (Join-Path $PSScriptRoot '..' 'README.md')
)

$content = Get-Content -Path $Path -Raw
$entryPattern = '(?m)^- \[(?<Name>[^\]]+)\]\((?<Url>[^)]+)\) - .+$'
$entryMatches = [regex]::Matches($content, $entryPattern)

foreach ($entryMatch in $entryMatches) {
    $name = $entryMatch.Groups['Name'].Value
    $url = $entryMatch.Groups['Url'].Value

    $candidates = [System.Collections.Generic.List[string]]::new()
    if ($url -match 'powershellgallery\.com/packages/(?<Id>[^/?#]+)') {
        $candidates.Add($Matches.Id)
    }
    $candidates.Add($name)
    $candidates.Add(($name -replace '\s', ''))
    $candidates.Add(($name -replace '\s', '.'))

    $found = $null
    foreach ($candidate in $candidates) {
        try {
            $found = Find-Module -Name $candidate -ErrorAction Stop | Select-Object -First 1
            if ($found) { break }
        }
        catch {
            continue
        }
    }

    [PSCustomObject]@{
        Name      = $name
        Url       = $url
        Author    = if ($found) { $found.Author } else { 'Not found' }
        Downloads = if ($found) { $found.AdditionalMetadata.downloadCount } else { 'Not found' }
    }
}
