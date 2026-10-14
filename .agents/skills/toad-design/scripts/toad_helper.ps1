<#
.SYNOPSIS
  TOAD Helper & Execution Bridge for AI Agents & Developers.
.DESCRIPTION
  Locates the TOAD executable or Node.js runtime, and runs commands (lint, report, format, build).
.EXAMPLE
  .\toad_helper.ps1 lint "design.toad"
  .\toad_helper.ps1 report "design.toad" -Strict
  .\toad_helper.ps1 format "design.toad"
  .\toad_helper.ps1 build "design.toad" -Format "png,webp,svg,psd,pdf"
#>

[CmdletBinding()]
param(
    [Parameter(Position=0, Mandatory=$true)]
    [string]$Action,

    [Parameter(Position=1, Mandatory=$false)]
    [string]$TargetFile,

    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$ExtraArgs
)

# 1. Resolve TOAD CLI executable
$toadCmd = Get-Command toad -ErrorAction SilentlyContinue

if ($toadCmd) {
    & toad $Action $TargetFile @ExtraArgs
    exit $LASTEXITCODE
}

# 2. Check LocalAppData portable installation
$localAppDataToad = Join-Path $env:LOCALAPPDATA "toad\bin\toad.cmd"
if (Test-Path $localAppDataToad) {
    & $localAppDataToad $Action $TargetFile @ExtraArgs
    exit $LASTEXITCODE
}

# 3. Check Workspace Repository Source (C:\toad)
$repoCli = "C:\toad\dist\cli.js"
$nodeExe = Get-Command node -ErrorAction SilentlyContinue

if (-not $nodeExe) {
    $portableNode = Join-Path $env:LOCALAPPDATA "toad\runtime\node.exe"
    if (Test-Path $portableNode) {
        $nodeExe = $portableNode
    }
}

if ($nodeExe -and (Test-Path $repoCli)) {
    & $nodeExe $repoCli $Action $TargetFile @ExtraArgs
    exit $LASTEXITCODE
}

Write-Warning "TOAD CLI is not currently available in PATH."
Write-Host "To install or enable TOAD locally, run: irm https://raw.githubusercontent.com/razy-me/toad/main/install.ps1 | iex" -ForegroundColor Cyan
Write-Host "Or install Node.js via winget: winget install OpenJS.NodeJS.LTS" -ForegroundColor Yellow
exit 1
