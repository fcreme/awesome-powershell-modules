<#
.SYNOPSIS
    Lists the distinct PowerShell Gallery authors across README.md and how many modules each has on the list.
.PARAMETER Path
    Path to the README.md file to parse.
.EXAMPLE
    ./Get-ModuleAuthor.ps1 | Format-Table
#>
[CmdletBinding()]
param(
    [string]$Path = (Join-Path $PSScriptRoot '..' 'README.md')
)

$content = Get-Content -Path $Path -Raw
$entryPattern = '(?m)^- \[(?<Name>[^\]]+)\]\((?<Url>[^)]+)\) - .+$'
$entryMatches = [regex]::Matches($content, $entryPattern)

$authors = foreach ($entryMatch in $entryMatches) {
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

    if ($found) { $found.Author } else { 'Not found' }
}

$authors |
    Group-Object |
    Sort-Object -Property Count -Descending |
    Select-Object @{Name = 'Author'; Expression = { $_.Name } }, Count
