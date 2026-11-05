# Publishing a Module to the PowerShell Gallery

If you'd like to submit your own module to this list, it needs to be installable the normal way first. Here's the short version of getting a module onto the [PowerShell Gallery](https://www.powershellgallery.com/).

## 1. Write a module manifest

Every publishable module needs a `.psd1` manifest. Generate a starting point with:

```powershell
New-ModuleManifest -Path .\MyModule\MyModule.psd1 -RootModule 'MyModule.psm1' -Author 'Your Name' -ModuleVersion '0.1.0'
```

At minimum, fill in `Description`, `Author`, `ModuleVersion`, and `ProjectUri` (link to your GitHub repo). A `LICENSE` file in the repo root is required too.

## 2. Test it locally

Import it from its own folder and confirm the commands work as expected before publishing anything:

```powershell
Import-Module .\MyModule\MyModule.psd1 -Force
Get-Command -Module MyModule
```

Running [PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer#readme) and [Pester](https://github.com/pester/Pester#readme) tests against it first will catch most obvious issues before anyone else installs it.

## 3. Get a PowerShell Gallery API key

Sign in to the [PowerShell Gallery](https://www.powershellgallery.com/) (a Microsoft account works) and generate an API key from your [account page](https://www.powershellgallery.com/account/apikeys). Scope it to a specific package name if you want to limit what it can publish.

## 4. Publish

Using PowerShellGet:

```powershell
Publish-Module -Path .\MyModule -NuGetApiKey $env:PSGALLERY_API_KEY
```

Or using the newer PSResourceGet:

```powershell
Publish-PSResource -Path .\MyModule -ApiKey $env:PSGALLERY_API_KEY
```

Don't commit the API key anywhere. Store it as a secret in whatever CI system you use, or keep it in a local environment variable.

## 5. Version it sensibly

Bump the `ModuleVersion` in the manifest before every publish; the Gallery rejects re-publishing the same version. Stick to [semantic versioning](https://semver.org/) so consumers can tell at a glance whether an update is safe to take.

## Before submitting it here

Per the [contribution guidelines](../CONTRIBUTING.md), a module needs to have existed for at least 30 days before it's added to this list. That's not about the Gallery specifically — it applies equally to a module that's only on GitHub — the point is just to give a new project a little time to prove it's not abandoned the week after it's created.
