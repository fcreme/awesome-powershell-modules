# Awesome PowerShell Modules [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

[![Lint Check](https://github.com/markwragg/awesome-powershell-modules/actions/workflows/awesome-lint.yml/badge.svg)](https://github.com/markwragg/awesome-powershell-modules/actions/workflows/awesome-lint.yml)
[![Repo Check](https://github.com/markwragg/awesome-powershell-modules/actions/workflows/archived-check.yml/badge.svg)](https://github.com/markwragg/awesome-powershell-modules/actions/workflows/archived-check.yml)
[![Link Check](https://github.com/markwragg/awesome-powershell-modules/actions/workflows/link-check.yml/badge.svg)](https://github.com/markwragg/awesome-powershell-modules/actions/workflows/link-check.yml)

> A curated list of awesome PowerShell modules for package management, testing, automation, security, cloud administration, and more.

PowerShell modules package up cmdlets, functions, and resources so they can be installed, versioned, and reused across scripts. This list focuses on modules that are actively maintained and worth reaching for first.

Install any module below with `Install-Module <Name>` (PowerShellGet) or `Install-PSResource <Name>` (PSResourceGet). Add `-Scope CurrentUser` to either command to install just for your user account, without requiring administrator rights.

## Contents

- [Package & Dependency Management](#package--dependency-management)
- [Testing & Code Quality](#testing--code-quality)
- [Build & Automation](#build--automation)
- [Documentation](#documentation)
- [Development Tools](#development-tools)
- [Secrets & Security](#secrets--security)
- [Logging & Diagnostics](#logging--diagnostics)
- [Shell Experience](#shell-experience)
- [Databases](#databases)
- [Cloud & Virtualization](#cloud--virtualization)
- [Windows Administration](#windows-administration)
- [Networking](#networking)
- [Web Servers & APIs](#web-servers--apis)
- [SaaS Integrations](#saas-integrations)
- [Reporting & Data Conversion](#reporting--data-conversion)
- [Parallelization](#parallelization)
- [Packaging & Deployment](#packaging--deployment)
- [Desktop & Personal Utilities](#desktop--personal-utilities)
- [Learning](#learning)
- [Fun & Novelty](#fun--novelty)

## Package & Dependency Management

- [Microsoft.PowerShell.PSResourceGet](https://github.com/PowerShell/PSResourceGet#readme) - Next-generation package manager for PowerShell modules, scripts, and DSC resources.
- [ModuleFast](https://github.com/JustinGrote/ModuleFast#readme) - Rapid, parallelized module installer for PowerShell. Prioritises speed of installation, at the expense of backwards compatibility.
- [PSDepend](https://github.com/PowerShellOrg/PSDepend#readme) - Declarative dependency handler for PowerShell projects, similar to Python's `pip install -r requirements.txt`.

## Testing & Code Quality

- [Pester](https://github.com/pester/Pester#readme) - BDD (Behaviour-Driven Development)-style test and mocking framework. Pester is the most widely used testing framework for PowerShell.
- [PSRule](https://github.com/microsoft/PSRule#readme) - Validates infrastructure as code and objects against PowerShell-defined rules.
- [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer#readme) - Static analysis tool that checks PowerShell code against a set of best-practice rules.
- [Selenium](https://github.com/adamdriscoll/selenium-powershell#readme) - Automates web browser interaction using the Selenium WebDriver.

## Build & Automation

- [BuildHelpers](https://github.com/PowerShellOrg/BuildHelpers#readme) - Provides helper functions for PowerShell CI/CD pipelines.
- [Catesta](https://github.com/techthoughts2/Catesta#readme) - Scaffolds PowerShell module projects with CI/CD pipelines for multiple platforms.
- [InvokeBuild](https://github.com/nightroman/Invoke-Build#readme) - Build and test automation tool with a task-based scripting model.
- [Microsoft.PowerShell.Crescendo](https://github.com/PowerShell/Crescendo#readme) - Wraps native command-line applications in PowerShell functions and modules.
- [ModuleBuilder](https://github.com/PoshCode/ModuleBuilder#readme) - Compiles multiple source files into a single PowerShell module for distribution.
- [Plaster](https://github.com/PowerShellOrg/Plaster#readme) - Scaffolds new PowerShell modules, scripts, and files from templates.
- [PowerShellBuild](https://github.com/psake/PowerShellBuild#readme) - Common build, test, and packaging tasks for PowerShell module projects.
- [psake](https://github.com/psake/psake#readme) - Build automation tool for defining and running build tasks in PowerShell.
- [PSDeploy](https://github.com/RamblingCookieMonster/PSDeploy#readme) - Defines and runs simple, declarative PowerShell-based deployments.
- [PSModuleDevelopment](https://github.com/PowershellFrameworkCollective/PSModuleDevelopment/tree/master#readme) - Provides templates and tooling for scaffolding new PowerShell modules.

## Documentation

- [platyPS](https://github.com/PowerShell/platyPS#readme) - Generates external help files and Markdown documentation from comment-based help.
- [PSDocs.Azure](https://github.com/Azure/PSDocs.Azure#readme) - Generates documentation from Azure infrastructure as code (IaC) artifacts.

## Development Tools

- [ClassExplorer](https://github.com/SeeminglyScience/ClassExplorer#readme) - Searches loaded .NET assemblies for types and members matching a query.
- [Graphical](https://github.com/PrateekKumarSingh/graphical#readme) - Plots scatter, bar, and line graphs directly in the console.
- [PoshColor](https://github.com/JustABearOz/PoshColor#readme) - Colorizes the output of common commands with support for custom themes.
- [psedit](https://github.com/ironmansoftware/psedit#readme) - Terminal-based text editor for PowerShell, including syntax highlighting for PowerShell, JSON, YAML, XML and Markdown.
- [PSGalleryExplorer](https://github.com/techthoughts2/PSGalleryExplorer#readme) - Searches, explores, and discovers modules on the PowerShell Gallery.
- [ps-menu](https://github.com/chrisseroka/ps-menu#readme) - Renders simple interactive menus in the console.
- [PSparklines](https://github.com/endowdly/PSparklines#readme) - Renders sparkline charts directly in the console.
- [PSQR](https://github.com/jakehildreth/psqr#readme) - Generates QR codes directly in the terminal, by wrapping the [qrencode](https://github.com/fukuchi/libqrencode) utility.
- [PSTuiTools](https://github.com/jdhitsolutions/PSTuiTools#readme) - Collection of terminal UI tools built with Terminal.Gui, primarily intended as examples and reference material.
- [PSWriteColor](https://github.com/EvotecIT/PSWriteColor#readme) - Writes multi-color text to the console on a single line.
- [PwshSpectreConsole](https://github.com/ShaunLawrie/PwshSpectreConsole/tree/main#readme) - Wraps the Spectre.Console library to build rich tables, prompts, and progress bars in the terminal.
- [ugit](https://github.com/StartAutomating/ugit#readme) - (Updated Git) extends and automates Git by converting Git output to PowerShell objects.

## Secrets & Security

- [ADSec](https://github.com/PSSecTools/ADSec#readme) - Provides tools for assessing and hardening Active Directory security.
- [AzureADAssessment](https://github.com/AzureAD/AzureADAssessment#readme) - Assesses the configuration and security posture of an Azure AD tenant.
- [EDCA](https://github.com/michelderooij/EDCA#readme) - Assesses Exchange Server deployment configuration and compliance.
- [HAWK](https://github.com/T0pCyber/hawk#readme) - Gathers forensic data for investigating Microsoft 365 account compromises.
- [JEAnalyzer](https://github.com/PSSecTools/JEAnalyzer#readme) - Converts scripts and script blocks into Just Enough Administration role capability files.
- [Locksmith](https://github.com/jakehildreth/Locksmith#readme) - Finds and fixes common misconfigurations in Active Directory Certificate Services.
- [Maester](https://github.com/maester365/maester#readme) - Test automation framework for monitoring Microsoft security configuration.
- [Microsoft.PowerShell.SecretManagement](https://github.com/PowerShell/SecretManagement#readme) - Provides a consistent interface for storing and retrieving secrets across different vaults.
- [Microsoft.PowerShell.SecretStore](https://github.com/PowerShell/SecretStore#readme) - Local, encrypted secret vault extension for SecretManagement.
- [OpenAuthenticode](https://github.com/jborean93/PowerShell-OpenAuthenticode#readme) - Cross-platform implementation of Authenticode for code signing and verification.
- [PSSecretScanner](https://github.com/bjompen/PSSecretScanner#readme) - Scans repositories for accidentally exposed secrets.
- [SecretManagement.DpapiNG](https://github.com/jborean93/SecretManagement.DpapiNG#readme) - SecretManagement vault extension that protects secrets using Windows DPAPI-NG.
- [SecretManagement.KeePass](https://github.com/JustinGrote/SecretManagement.KeePass#readme) - SecretManagement vault extension for KeePass databases.

## Logging & Diagnostics

- [PoShLog](https://github.com/PoShLog/PoShLog#readme) - Cross-platform logging module built on Serilog.
- [PSEtw](https://github.com/jborean93/PSEtw#readme) - Consumes and processes Event Tracing for Windows (ETW) events.
- [PSFramework](https://github.com/PowershellFrameworkCollective/PSFramework/tree/master#readme) - Configuration, logging, and runtime framework for building robust PowerShell tooling.
- [PSProfiler](https://github.com/IISResetMe/PSProfiler#readme) - Measures the execution time of individual statements within a script.

## Shell Experience

- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh#readme) - Installs and manages the oh-my-posh cross-shell prompt theme engine, which renders prompts using its own compiled binary rather than PowerShell code.
- [posh-git](https://github.com/dahlbyk/posh-git#readme) - Integrates Git status and tab completion into the PowerShell prompt.
- [PowerShellRun](https://github.com/mdgrs-mei/PowerShellRun#readme) - Terminal-based launcher and fuzzy finder for PowerShell.
- [PSFzf](https://github.com/kelleyma49/PSFzf#readme) - Integrates the [fzf](https://github.com/junegunn/fzf) fuzzy finder with command history and tab completion.
- [PSPreworkout](https://github.com/samerde/PSPreWorkout#readme) - Collection of tools for warming up and customizing a PowerShell session.
- [PSReadLine](https://github.com/PowerShell/PSReadLine#readme) - Provides syntax highlighting, history search, and improved command-line editing.
- [PSScriptTools](https://github.com/jdhitsolutions/PSScriptTools#readme) - Collection of functions to enhance your own PowerShell scripts and console work.
- [PSTui](https://github.com/tui-cs/PSTui#readme) - Adds console-based grid view and list selection cmdlets such as `Out-ConsoleGridView`.
- [PSUtil](https://github.com/PowershellFrameworkCollective/PSUtil#readme) - Provides shortcuts, aliases, and convenience functions for a more efficient console experience.
- [Terminal-Icons](https://github.com/devblackops/Terminal-Icons#readme) - Adds file and folder icons to directory listings based on file type.
- [Watch](https://github.com/markwragg/Powershell-Watch#readme) - Repeatedly runs a command or script block and returns output only when it changes.

## Databases

- [dbatools](https://github.com/dataplat/dbatools/tree/master#readme) - Automates [Microsoft SQL Server](https://www.microsoft.com/en-gb/sql-server) instance migration, administration, and best-practice checks.
- [Influx](https://github.com/markwragg/PowerShell-Influx#readme) - Writes and queries data in the [InfluxDB](https://www.influxdata.com/) time-series database.
- [Mdbc](https://github.com/nightroman/Mdbc#readme) - Provides cmdlets for working with [MongoDB](https://www.mongodb.com/).
- [SimplySql](https://github.com/mithrandyr/SimplySql#readme) - Provides a vendor-agnostic set of cmdlets for connecting to and querying databases.
- [SqlServer](https://www.powershellgallery.com/packages/SqlServer) - Official module for querying and managing [Microsoft SQL Server](https://www.microsoft.com/en-gb/sql-server) instances and databases.

## Cloud & Virtualization

- [AWS Tools for PowerShell](https://github.com/aws/aws-tools-for-powershell#readme) - Manages [AWS](https://aws.amazon.com/) services and resources directly from PowerShell.
- [Az](https://github.com/Azure/azure-powershell#readme) - Manages [Azure](https://azure.microsoft.com/) resources, from virtual machines to storage accounts, via cmdlets.
- [AzAuth](https://github.com/PalmEmanuel/AzAuth#readme) - Handles Azure authentication and token acquisition for PowerShell scripts and modules.
- [AzCostTools](https://github.com/markwragg/PowerShell-AzCostTools#readme) - Provides cmdlets for analyzing and reporting on Azure cost data.
- [AzViz](https://github.com/PrateekKumarSingh/AzViz#readme) - Generates visual topology diagrams of Azure resource groups.
- [Bicep](https://github.com/PSBicep/PSBicep#readme) - Compiles, decompiles, and manages Bicep Azure infrastructure-as-code files.
- [MIAU](https://github.com/HCRitter/MIAU#readme) - Simplifies day-to-day Azure Managed Identity operations.
- [Microsoft.Entra](https://github.com/microsoftgraph/entra-powershell#readme) - Official module for managing Microsoft Entra ID resources such as users, groups, and applications.
- [Microsoft.Graph](https://github.com/microsoftgraph/msgraph-sdk-powershell#readme) - Official Microsoft Graph SDK for PowerShell, covering Entra ID, Teams, SharePoint, and more.
- [Microsoft365DSC](https://github.com/Microsoft365DSC/Microsoft365DSC#readme) - Manages, configures, extracts, and monitors Microsoft 365 tenant configurations.
- [PnP.PowerShell](https://github.com/pnp/powershell/tree/main#readme) - Manages SharePoint Online and Microsoft 365 through PnP cmdlets.
- [VCF.PowerCLI](https://www.powershellgallery.com/packages/VCF.PowerCLI) - Automates vSphere, vSAN, and NSX administration tasks.

## Windows Administration

- [ADMF](https://github.com/ActiveDirectoryManagementFramework/ADMF#readme) - Manages Active Directory configuration as declarative, version-controlled contexts.
- [AutomatedLab](https://github.com/AutomatedLab/AutomatedLab/tree/master#readme) - Provisions complex Active Directory, Exchange, and PKI test labs on Hyper-V and Azure.
- [BlueTuxedo](https://github.com/jakehildreth/BlueTuxedo#readme) - Finds and fixes common misconfigurations in Active Directory-integrated DNS.
- [DSInternals](https://github.com/michaelgrafnetter/DSInternals#readme) - Audits password hashes, manipulates offline ntds.dit files, and recovers domain controllers from IFM backups.
- [Evergreen](https://github.com/EUCPilots/evergreen-module#readme) - Returns the latest version numbers and download URLs for common third-party applications.
- [FindOpenFile](https://github.com/ironmansoftware/findopenfiles#readme) - Finds processes that are holding files open.
- [GPOTools](https://github.com/FriedrichWeinmann/GPOTools/tree/master#readme) - Provides tools for managing and auditing Group Policy Objects.
- [GPOZaurr](https://github.com/EvotecIT/GPOZaurr#readme) - GPO Policy Eater finds and fixes common Group Policy misconfigurations.
- [kbupdate](https://github.com/potatoqualitee/kbupdate#readme) - Views, saves, installs, and uninstalls Windows update packages.
- [PSOpenAD](https://github.com/jborean93/PSOpenAD#readme) - Cross-platform alternative to the Microsoft Active Directory module.
- [PSPKI](https://github.com/Crypt32/PSPKI#readme) - Manages Active Directory Certificate Services and X.509 certificates.
- [PSWindowsUpdate](https://github.com/mgajda83/PSWindowsUpdate#readme) - Manages and installs Windows Update packages from the command line.
- [TheCleaners](https://github.com/SamErde/TheCleaners#readme) - Cleans up loose ends and leftover artifacts on Windows Servers.

## Networking

- [Posh-SSH](https://github.com/darkoperator/Posh-SSH#readme) - Creates SSH and SCP sessions to run commands and transfer files on remote hosts.
- [PSDiscoveryProtocol](https://github.com/lahell/PSDiscoveryProtocol#readme) - Captures and parses CDP and LLDP packets to discover neighbouring network devices.
- [Subnet](https://github.com/markwragg/PowerShell-Subnet#readme) - Performs subnet calculations such as CIDR conversion, host ranges, and address overlap checks.

## Web Servers & APIs

- [Pode](https://github.com/Badgerati/Pode/tree/master#readme) - Cross-platform framework for building web servers, REST APIs, and SMTP/TCP servers.
- [Pode.Web](https://github.com/Badgerati/Pode.Web/tree/master#readme) - Web template framework for building front-ends on top of Pode.

## SaaS Integrations

- [ADOPS](https://github.com/AZDOPS/AZDOPS#readme) - Manages Azure DevOps projects, pipelines, and work items using OAuth instead of personal access tokens.
- [ConfluencePS](https://github.com/AtlassianPS/ConfluencePS#readme) - Manages Confluence pages and spaces via the Confluence REST API.
- [CurrencyConverter](https://github.com/markwragg/PowerShell-CurrencyConverter#readme) - Converts and reports on currency exchange rates.
- [JiraPS](https://github.com/AtlassianPS/JiraPS#readme) - Manages Jira issues, projects, and workflows via the Jira REST API.
- [Mailozaurr](https://github.com/EvotecIT/Mailozaurr#readme) - Sends and receives email over SMTP, IMAP, and POP3.
- [PoshBot](https://github.com/poshbotio/PoshBot#readme) - ChatOps bot framework for building chat bots in Slack, Microsoft Teams, and Discord.
- [PowerTrello](https://github.com/adbertram/PowerTrello#readme) - Manages Trello boards, lists, and cards via the Trello API.
- [PSAI](https://github.com/dfinke/PSAI#readme) - Framework for building and orchestrating multi-agent AI systems in PowerShell.
- [PSAISuite](https://github.com/dfinke/psaisuite#readme) - Standardized abstraction layer for calling 15+ GenAI providers from PowerShell.
- [PSOpenAI](https://github.com/mkht/PSOpenAI#readme) - Wraps the OpenAI API for use in PowerShell scripts.
- [PSPushover](https://github.com/joshooaj/PSPushover#readme) - Sends push notifications through the [Pushover](https://pushover.net/) service.
- [PSTeams](https://github.com/EvotecIT/PSTeams#readme) - Sends formatted adaptive card messages to Microsoft Teams channels.
- [ServiceNow](https://github.com/Snow-Shell/servicenow-powershell#readme) - Automates ServiceNow service and asset management.
- [TOPdeskPS](https://github.com/AndrewPla/TOPdeskPS/tree/master#readme) - Interacts with the TOPdesk IT service management API.
- [VSTeam](https://github.com/MethodsAndPractices/vsteam#readme) - Wraps the Azure DevOps API for use in PowerShell scripts.

## Reporting & Data Conversion

- [ImportExcel](https://github.com/dfinke/ImportExcel#readme) - Reads and writes Excel files without requiring Excel to be installed.
- [powershell-yaml](https://github.com/cloudbase/powershell-yaml#readme) - Converts between YAML and PowerShell objects.
- [PSHTML](https://github.com/stephanevg/PSHTML#readme) - Generates HTML markup using a PowerShell-based DSL.
- [PSMarkdown](https://github.com/ishu3101/PSMarkdown#readme) - Converts PowerShell objects to and from Markdown tables.
- [PSWriteHTML](https://github.com/EvotecIT/PSWriteHTML#readme) - Builds interactive HTML reports, dashboards, and charts.
- [PSWriteOffice](https://github.com/EvotecIT/OfficeIMO/tree/master/PowerShell/PSWriteOffice#readme) - Creates and edits Word, Excel, PowerPoint, and PDF documents without requiring Microsoft Office.

## Parallelization

- [PoshRSJob](https://github.com/proxb/PoshRSJob#readme) - Runs script blocks in parallel using runspaces instead of background jobs.
- [ThreadJob](https://github.com/PowerShell/ThreadJob#readme) - Runs background jobs in lightweight threads within the same process.

## Packaging & Deployment

- [IntuneHydrationKit](https://github.com/jorgeasaurus/IntuneHydrationKit#readme) - Imports a set of starter configuration baselines into Microsoft Intune.
- [Invoke-CommandAs](https://github.com/mkellerman/Invoke-CommandAs#readme) - Runs commands as System, a GMSA, or another user on local or remote machines.
- [PS2EXE](https://github.com/MScholtes/PS2EXE#readme) - Compiles PowerShell scripts into standalone Windows executables.
- [PSAppDeployToolkit](https://github.com/psappdeploytoolkit/PSAppDeployToolkit#readme) - Standardizes application deployment, detection, and uninstallation for Windows.
- [PSMSI](https://github.com/ironmansoftware/psmsi#readme) - Creates MSI installers using PowerShell.
- [RunAsUser](https://github.com/KelvinTegelaar/RunAsUser#readme) - Runs scripts as the logged-on user while executing under the SYSTEM account.

## Desktop & Personal Utilities

- [HashCopy](https://github.com/markwragg/Powershell-HashCopy#readme) - Copies and compares files between two paths based on computed hash values rather than modified dates.
- [Lumos](https://github.com/markwragg/powershell-lumos#readme) - Switches Windows, macOS, and Linux between light and dark themes depending on the time of day.
- [PSBluesky](https://github.com/jdhitsolutions/PSBluesky#readme) - Posts, views, and manages your feed and timeline on Bluesky.
- [PSCalendar](https://github.com/jdhitsolutions/PSCalendar#readme) - Displays calendars in the console.
- [PSCommander](https://github.com/ironmansoftware/pscommander#readme) - Wires up desktop integrations such as hotkeys, tray icons, and scheduled tasks to PowerShell script blocks.
- [PSWorkItem](https://github.com/jdhitsolutions/PSWorkItem#readme) - Manages personal tasks and to-do items backed by a local SQLite database.

## Learning

- [PSClaudeCode](https://github.com/dfinke/PSClaudeCode#readme) - PowerShell implementation of the Claude Code agent loop, including tools and permissions.
- [PSKoans](https://github.com/PowerShellOrg/PSKoans#readme) - Teaches the PowerShell language through a series of Pester-based coding exercises.
- [Tiny-PowerShell-Projects](https://github.com/dfinke/Tiny-PowerShell-Projects#readme) - Teaches PowerShell through test-driven development of small games and puzzles.
- [tiPS](https://github.com/deadlydog/PowerShell.tiPS#readme) - Delivers PowerShell tips and tricks directly to your terminal on a schedule.

## Fun & Novelty

- [PSPodcast](https://github.com/jdhitsolutions/PSPodcast#readme) - Gets and displays episode information for The PowerShell Podcast.
- [pwshPlaces](https://github.com/techthoughts2/PwshPlaces#readme) - Searches for places and points of interest around the globe.
- [XKCD](https://github.com/markwragg/Powershell-XKCD#readme) - Fetches, searches, and displays comics from the XKCD webcomic.

## Contributing

Contributions welcome! Read the [contribution guidelines](CONTRIBUTING.md) first.

## Footnotes

Candidate modules for this list were researched and fact-checked (maintenance status, archival state, actual PowerShell Gallery package names) with AI assistance. Every addition, rejection, and categorization decision was made by a human maintainer.

### Awesome mentioned badge

If you are the maintainer of a module on this list, and would like to showcase your inclusion, you can do so by adding the following badge:

[![Mentioned in Awesome PowerShell Modules](https://awesome.re/mentioned-badge.svg)](https://github.com/markwragg/awesome-powershell-modules#readme)

```markdown
[![Mentioned in Awesome PowerShell Modules](https://awesome.re/mentioned-badge.svg)](https://github.com/markwragg/awesome-powershell-modules#readme)
```
