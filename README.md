# Awesome PowerShell Modules [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A curated list of awesome PowerShell modules for package management, testing, automation, security, cloud administration, and more.

PowerShell modules package up cmdlets, functions, and resources so they can be installed, versioned, and reused across scripts. This list focuses on modules that are actively maintained and worth reaching for first.

## Contents

- [Package & Dependency Management](#package--dependency-management)
- [Testing & Code Quality](#testing--code-quality)
- [Build & Automation](#build--automation)
- [Documentation](#documentation)
- [Secrets & Security](#secrets--security)
- [Logging & Diagnostics](#logging--diagnostics)
- [Shell Experience](#shell-experience)
- [Databases](#databases)
- [Cloud & Virtualization](#cloud--virtualization)
- [Networking](#networking)
- [Web Servers & APIs](#web-servers--apis)
- [SaaS Integrations](#saas-integrations)
- [Reporting & Data Export](#reporting--data-export)
- [Parallelization](#parallelization)
- [Packaging & Deployment](#packaging--deployment)
- [Productivity](#productivity)
- [Fun & Novelty](#fun--novelty)

## Package & Dependency Management

- [PSResourceGet](https://github.com/PowerShell/PSResourceGet#readme) - Next-generation package manager for PowerShell modules, scripts, and DSC resources.
- [ModuleFast](https://github.com/JustinGrote/ModuleFast#readme) - Rapid, parallelized module installer for PowerShell.
- [PSDepend](https://github.com/PowerShellOrg/PSDepend#readme) - Declarative dependency handler for PowerShell projects.

## Testing & Code Quality

- [Pester](https://github.com/pester/Pester#readme) - BDD-style test and mocking framework for PowerShell.
- [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer#readme) - Static analysis tool that checks PowerShell code against a set of best-practice rules.
- [Selenium](https://github.com/adamdriscoll/selenium-powershell#readme) - Automates web browsers using the Selenium WebDriver.

## Build & Automation

- [psake](https://github.com/psake/psake#readme) - Build automation tool for defining and running build tasks in PowerShell.
- [Invoke-Build](https://github.com/nightroman/Invoke-Build#readme) - Build and test automation tool with a task-based scripting model.
- [PowerShellBuild](https://github.com/psake/PowerShellBuild#readme) - Common build, test, and packaging tasks for PowerShell module projects.
- [ModuleBuilder](https://github.com/PoshCode/ModuleBuilder#readme) - Compiles multiple source files into a single PowerShell module for distribution.
- [Plaster](https://github.com/PowerShellOrg/Plaster#readme) - Scaffolds new PowerShell modules, scripts, and files from templates.
- [Catesta](https://github.com/techthoughts2/Catesta#readme) - Scaffolds PowerShell module projects with CI/CD pipelines for multiple platforms.
- [PSModuleDevelopment](https://github.com/PowershellFrameworkCollective/PSModuleDevelopment#readme) - Provides templates and tooling for scaffolding new PowerShell modules.

## Documentation

- [platyPS](https://github.com/PowerShell/platyPS#readme) - Generates external help files and Markdown documentation from comment-based help.
- [PSDocs](https://github.com/microsoft/PSDocs#readme) - Generates Markdown documentation from objects using a domain-specific language.

## Secrets & Security

- [SecretManagement](https://github.com/PowerShell/SecretManagement#readme) - Provides a consistent interface for storing and retrieving secrets across different vaults.
- [SecretStore](https://github.com/PowerShell/SecretStore#readme) - Local, encrypted secret vault extension for SecretManagement.
- [SecretManagement.DpapiNG](https://github.com/jborean93/SecretManagement.DpapiNG#readme) - SecretManagement vault extension that protects secrets using Windows DPAPI-NG.
- [PSPKI](https://github.com/Crypt32/PSPKI#readme) - Manages Active Directory Certificate Services and X.509 certificates.
- [PoShKeePass](https://github.com/PSKeePass/PoShKeePass#readme) - Manages KeePass databases, entries, and groups.
- [Locksmith](https://github.com/jakehildreth/Locksmith#readme) - Finds and fixes common misconfigurations in Active Directory Certificate Services.

## Logging & Diagnostics

- [PSFramework](https://github.com/PowershellFrameworkCollective/PSFramework#readme) - Configuration, logging, and runtime framework for building robust PowerShell tooling.
- [PoShLog](https://github.com/PoShLog/PoShLog#readme) - Cross-platform logging module built on Serilog.
- [PSProfiler](https://github.com/IISResetMe/PSProfiler#readme) - Measures the execution time of individual statements within a script.

## Shell Experience

- [PSReadLine](https://github.com/PowerShell/PSReadLine#readme) - Provides syntax highlighting, history search, and improved command-line editing.
- [posh-git](https://github.com/dahlbyk/posh-git#readme) - Integrates Git status and tab completion into the PowerShell prompt.
- [Terminal-Icons](https://github.com/devblackops/Terminal-Icons#readme) - Adds file and folder icons to directory listings based on file type.
- [PSFzf](https://github.com/kelleyma49/PSFzf#readme) - Integrates the fzf fuzzy finder with command history and tab completion.
- [ConsoleGuiTools](https://github.com/PowerShell/ConsoleGuiTools#readme) - Adds console-based grid view and list selection cmdlets such as `Out-ConsoleGridView`.
- [PowerLine](https://github.com/Jaykul/PowerLine#readme) - Provides classes for building richer, multi-line prompts and console output.
- [PoshColor](https://github.com/JustABearOz/PoshColor#readme) - Colorizes the output of common commands with support for custom themes.
- [PwshSpectreConsole](https://github.com/ShaunLawrie/PwshSpectreConsole#readme) - Wraps the Spectre.Console library to build rich tables, prompts, and progress bars in the terminal.
- [PSTuiTools](https://github.com/jdhitsolutions/PSTuiTools#readme) - Collection of terminal UI tools built with Terminal.Gui.

## Databases

- [dbatools](https://github.com/dataplat/dbatools#readme) - Automates SQL Server instance migration, administration, and best-practice checks.
- [SqlServer](https://www.powershellgallery.com/packages/SqlServer) - Official module for querying and managing SQL Server instances and databases.
- [SimplySql](https://github.com/mithrandyr/SimplySql#readme) - Provides a vendor-agnostic set of cmdlets for connecting to and querying databases.

## Cloud & Virtualization

- [Az](https://github.com/Azure/azure-powershell#readme) - Manages Azure resources, from virtual machines to storage accounts, via cmdlets.
- [AWS Tools for PowerShell](https://github.com/aws/aws-tools-for-powershell#readme) - Manages AWS services and resources directly from PowerShell.
- [VMware PowerCLI](https://www.powershellgallery.com/packages/VMware.PowerCLI) - Automates vSphere, vSAN, and NSX administration tasks.

## Networking

- [Posh-SSH](https://github.com/darkoperator/Posh-SSH#readme) - Creates SSH and SCP sessions to run commands and transfer files on remote hosts.
- [Subnet](https://github.com/markwragg/PowerShell-Subnet#readme) - Performs subnet calculations such as CIDR conversion, host ranges, and address overlap checks.

## Web Servers & APIs

- [Pode](https://github.com/Badgerati/Pode#readme) - Cross-platform framework for building web servers, REST APIs, and SMTP/TCP servers.
- [Polaris](https://github.com/PowerShell/Polaris#readme) - Minimalist, cross-platform web framework for building HTTP APIs.

## SaaS Integrations

- [JiraPS](https://github.com/AtlassianPS/JiraPS#readme) - Manages Jira issues, projects, and workflows via the Jira REST API.
- [ConfluencePS](https://github.com/AtlassianPS/ConfluencePS#readme) - Manages Confluence pages and spaces via the Confluence REST API.
- [PSTeams](https://github.com/EvotecIT/PSTeams#readme) - Sends formatted adaptive card messages to Microsoft Teams channels.

## Reporting & Data Export

- [ImportExcel](https://github.com/dfinke/ImportExcel#readme) - Reads and writes Excel files without requiring Excel to be installed.
- [PSWriteHTML](https://github.com/EvotecIT/PSWriteHTML#readme) - Builds interactive HTML reports, dashboards, and charts.
- [PSWriteWord](https://github.com/EvotecIT/PSWriteWord#readme) - Creates and edits Word documents without requiring Word to be installed.
- [PSWriteColor](https://github.com/EvotecIT/PSWriteColor#readme) - Writes multi-color text to the console on a single line.
- [PSWritePDF](https://github.com/EvotecIT/PSWritePDF#readme) - Creates, edits, splits, and merges PDF files.
- [powershell-yaml](https://github.com/cloudbase/powershell-yaml#readme) - Converts between YAML and PowerShell objects.

## Parallelization

- [PoshRSJob](https://github.com/proxb/PoshRSJob#readme) - Runs script blocks in parallel using runspaces instead of background jobs.
- [ThreadJob](https://github.com/PowerShell/ThreadJob#readme) - Runs background jobs in lightweight threads within the same process.

## Packaging & Deployment

- [PS2EXE](https://github.com/MScholtes/PS2EXE#readme) - Compiles PowerShell scripts into standalone Windows executables.
- [PSAppDeployToolkit](https://github.com/psappdeploytoolkit/PSAppDeployToolkit#readme) - Standardizes application deployment, detection, and uninstallation for Windows.
- [RunAsUser](https://github.com/KelvinTegelaar/RunAsUser#readme) - Runs scripts as the logged-on user while executing under the SYSTEM account.

## Productivity

- [PSWorkItem](https://github.com/jdhitsolutions/PSWorkItem#readme) - Manages personal tasks and to-do items backed by a local SQLite database.

## Fun & Novelty

- [XKCD](https://github.com/markwragg/Powershell-XKCD#readme) - Fetches, searches, and displays comics from the XKCD webcomic.
- [PoshBot](https://github.com/poshbotio/PoshBot#readme) - ChatOps bot framework for building chat bots in Slack, Microsoft Teams, and Discord.
- [PSPodcast](https://github.com/jdhitsolutions/PSPodcast#readme) - Gets and displays episode information for The PowerShell Podcast.
- [PSBluesky](https://github.com/jdhitsolutions/PSBluesky#readme) - Posts, views, and manages your feed and timeline on Bluesky.

## Contributing

Contributions welcome! Read the [contribution guidelines](CONTRIBUTING.md) first.
