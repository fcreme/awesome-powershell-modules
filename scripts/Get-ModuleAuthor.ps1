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

$detailsScript = Join-Path $PSScriptRoot 'Get-ModuleDetails.ps1'

& $detailsScript -Path $Path |
    Group-Object -Property Author |
    Sort-Object -Property Count -Descending |
    Select-Object @{Name = 'Author'; Expression = { $_.Name } }, Count
