<#
.SYNOPSIS
    Checks every GitHub repo linked from README.md and reports any with no commits in over StaleYears.
.PARAMETER Path
    Path to the README.md file to parse.
.PARAMETER GitHubToken
    Optional token used to authenticate GitHub API requests and avoid rate limiting.
.PARAMETER StaleYears
    Number of years of inactivity (no pushes) before a repo is considered stale. Default 5.
.PARAMETER ExcludeRepo
    Repos (owner/name) to skip, e.g. ones kept intentionally despite being stale (feature-complete, not abandoned).
.EXAMPLE
    ./Test-StaleRepos.ps1
.EXAMPLE
    ./Test-StaleRepos.ps1 -GitHubToken $env:GITHUB_TOKEN -StaleYears 5
#>
[CmdletBinding()]
param(
    [string]$Path = (Join-Path $PSScriptRoot '..' 'README.md'),
    [string]$GitHubToken = $env:GITHUB_TOKEN,
    [int]$StaleYears = 5,
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

$headers = @{ 'User-Agent' = 'awesome-powershell-modules-stale-check' }
if ($GitHubToken) {
    $headers['Authorization'] = "Bearer $GitHubToken"
}

$staleBefore = (Get-Date).AddYears(-$StaleYears)

$stale = foreach ($repo in $repos) {
    try {
        $info = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo" -Headers $headers -ErrorAction Stop
        $pushedAt = [datetime]$info.pushed_at
        if ($pushedAt -lt $staleBefore) {
            [PSCustomObject]@{ Repo = $repo; Url = "https://github.com/$repo"; LastPush = $pushedAt }
        }
    }
    catch {
        Write-Warning "Could not check $repo : $($_.Exception.Message)"
    }
}

if ($stale) {
    $stale = $stale | Sort-Object LastPush
    foreach ($repoInfo in $stale) {
        Write-Host ("::warning::{0} has had no commits since {1:yyyy-MM-dd} (over {2} years)" -f $repoInfo.Url, $repoInfo.LastPush, $StaleYears)
    }
    Write-Host "Stale repositories found (no commits in over $StaleYears years):" -ForegroundColor Yellow
    $stale | ForEach-Object { Write-Host (" - {0} (last push {1:yyyy-MM-dd})" -f $_.Url, $_.LastPush) -ForegroundColor Yellow }
}
else {
    Write-Host "No stale repositories found among $($repos.Count) checked." -ForegroundColor Green
}

$stale
