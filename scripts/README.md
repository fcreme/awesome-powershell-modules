# Awesome PowerShell Modules Scripts

This folder contains scripts that can be used to interrogate the awesome-powershell-modules readme.md.

## Get-ModuleAuthor

Lists the distinct PowerShell Gallery authors across README.md and how many modules each has on the list.

```powershell
.\Get-ModuleAuthor.ps1 | FT
```
```text
Author                Count
------                -----
Microsoft Corporation    12
Mark Wragg                8
Przemyslaw Klys           7
Jeff Hicks                5
Brandon Olin              3
Friedrich Weinmann        3
Not found                 2
AtlassianPS               2
Douglas Finke             2
Jordan Borean             2
...

```

## Get-ModuleDetails

Lists every module in README.md along with its name, URL, PowerShell Gallery author, and download count.

```powershell
.\Get-ModuleDetails.ps1 | FT

```
```text
Name                               Url                                                Author                     Downloads
----                               ---                                                ------                     ---------
Microsoft.PowerShell.PSResourceGet https://github.com/PowerShell/PSResourceGet#readme Microsoft Corporation      5023128
ModuleFast                         https://github.com/JustinGrote/ModuleFast#readme   Justin Grote @justinwgrote 7183
PSDepend                           https://github.com/PowerShellOrg/PSDepend#readme   Warren Frame               2079799
PSGalleryExplorer                  https://github.com/techthoughts2/PSGalleryExplore… Jake Morrison              16610
Pester                             https://github.com/pester/Pester#readme            Pester Team                40923786
PSScriptAnalyzer                   https://github.com/PowerShell/PSScriptAnalyzer#re… Microsoft Corporation      13672377
PSRule                             https://github.com/microsoft/PSRule#readme         Microsoft Corporation      4331219
Selenium                           https://github.com/adamdriscoll/selenium-powershe… Adam Driscoll              1706807
psake                              https://github.com/psake/psake#readme              James Kovacs               1329011
InvokeBuild                        https://github.com/nightroman/Invoke-Build#readme  Roman Kuzmin               2999721
...
```