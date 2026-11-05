<#
.SYNOPSIS
    Checks every GitHub repo linked from README.md and reports any that have been archived.
.PARAMETER Path
    Path to the README.md file to parse.
.PARAMETER GitHubToken
    Optional token used to authenticate GitHub API requests and avoid rate limiting.
.PARAMETER ExcludeRepo
    Repos (owner/name) to skip, e.g. ones kept intentionally despite being archived.
.EXAMPLE
    ./Test-ArchivedRepos.ps1
.EXAMPLE
    ./Test-ArchivedRepos.ps1 -GitHubToken $env:GITHUB_TOKEN
#>
[CmdletBinding()]
param(
    [string]$Path = (Join-Path $PSScriptRoot '..' 'README.md'),
    [string]$GitHubToken = $env:GITHUB_TOKEN,
    [string[]]$ExcludeRepo = @(
        # Archived by the PowerShell team as "feature complete", not abandoned. Still the standard, functional way to do this.
        'PowerShell/SecretManagement',
        'PowerShell/SecretStore'
    )
)

$content = Get-Content -Path $Path -Raw
$repoPattern = 'github\.com/(?<Repo>[A-Za-z0-9._-]+/[A-Za-z0-9._-]+)'
$repos = [regex]::Matches($content, $repoPattern) |
    ForEach-Object { $_.Groups['Repo'].Value } |
    Sort-Object -Unique |
    Where-Object { $ExcludeRepo -notcontains $_ }

$headers = @{ 'User-Agent' = 'awesome-powershell-modules-archive-check' }
if ($GitHubToken) {
    $headers['Authorization'] = "Bearer $GitHubToken"
}

$archived = foreach ($repo in $repos) {
    try {
        $info = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo" -Headers $headers -ErrorAction Stop
        if ($info.archived) {
            [PSCustomObject]@{ Repo = $repo; Url = "https://github.com/$repo" }
        }
    }
    catch {
        Write-Warning "Could not check $repo : $($_.Exception.Message)"
    }
}

if ($archived) {
    Write-Host "Archived repositories found:" -ForegroundColor Red
    $archived | ForEach-Object { Write-Host " - $($_.Url)" -ForegroundColor Red }
    exit 1
}

Write-Host "No archived repositories found among $($repos.Count) checked." -ForegroundColor Green
