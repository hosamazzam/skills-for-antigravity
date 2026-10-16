# Automated 1-Click Updater for Antigravity Skills (Windows)
# Usage: powershell -ExecutionPolicy Bypass -File update.ps1

$ErrorActionPreference = "Stop"

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "    Updating Skills for Google Antigravity          " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

# 1. Fetch latest changes if this is a Git clone
if (Test-Path (Join-Path $PSScriptRoot ".git")) {
    Write-Host "-> Checking for latest commits on GitHub..." -ForegroundColor Yellow
    try {
        git -C $PSScriptRoot pull --rebase
    } catch {
        Write-Warning "Could not run git pull automatically. Proceeding to update local files..."
    }
}

# 2. Run installer script to copy/overwrite into ~/.gemini/config/
$installer = Join-Path $PSScriptRoot "install.ps1"
if (Test-Path $installer) {
    & powershell -ExecutionPolicy Bypass -File $installer
} else {
    Write-Error "Installer script not found at $installer"
}

Write-Host "`n🔄 All skills and rules updated successfully on your machine!" -ForegroundColor Green
Write-Host "👉 Tip: Open a New Chat (Ctrl+N) in Antigravity to load the latest changes." -ForegroundColor White
