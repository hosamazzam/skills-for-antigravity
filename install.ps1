# Automated Installer & Updater for Antigravity Skills (Windows)
# Usage: powershell -ExecutionPolicy Bypass -File install.ps1

$ErrorActionPreference = "Stop"

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "   Installing / Updating Skills for Antigravity     " -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

$geminiConfigDir = Join-Path $env:USERPROFILE ".gemini\config"
$targetSkillsDir = Join-Path $geminiConfigDir "skills"
$targetGlobalRule = Join-Path $geminiConfigDir "GEMINI.md"

if (-not (Test-Path $targetSkillsDir)) {
    Write-Host "Creating target skills directory: $targetSkillsDir" -ForegroundColor Yellow
    New-Item -ItemType Directory -Force -Path $targetSkillsDir | Out-Null
}

$repoSkillsDir = Join-Path $PSScriptRoot "skills"
$skills = Get-ChildItem -Path $repoSkillsDir -Directory

foreach ($skill in $skills) {
    $dest = Join-Path $targetSkillsDir $skill.Name
    Write-Host "-> Installing / Overwriting skill: [$($skill.Name)]..." -ForegroundColor Green
    Copy-Item -Path $skill.FullName -Destination $dest -Recurse -Force
}

$sourceGlobalRule = Join-Path $PSScriptRoot "GEMINI.md"
if (Test-Path $sourceGlobalRule) {
    if (-not (Test-Path $targetGlobalRule)) {
        Write-Host "-> Creating global rules file: $targetGlobalRule..." -ForegroundColor Green
        Copy-Item -Path $sourceGlobalRule -Destination $targetGlobalRule -Force
    } else {
        Write-Host "-> Updating global rules in GEMINI.md..." -ForegroundColor Green
        $existingContent = Get-Content -Path $targetGlobalRule -Raw
        $newContent = Get-Content -Path $sourceGlobalRule -Raw
        
        # If GEMINI.md is purely for our skills, or to update the existing section
        if ($existingContent -match "usage-report" -or $existingContent -match "Usage & Token Consumption Report") {
            # Replace/overwrite with latest official rules
            Copy-Item -Path $sourceGlobalRule -Destination $targetGlobalRule -Force
            Write-Host "-> Synced latest rules into $targetGlobalRule!" -ForegroundColor Green
        } else {
            # Append to user's custom existing rules
            Write-Host "-> Appending usage rules to your existing GEMINI.md..." -ForegroundColor Green
            Add-Content -Path $targetGlobalRule -Value "`n`n$newContent"
        }
    }
}

Write-Host "`n✅ Successfully installed/updated all skills!" -ForegroundColor Cyan
Write-Host "You can now use /usage-report and /session-summary in any Antigravity conversation." -ForegroundColor White
Write-Host "Tip: Open a New Chat (Ctrl+N) to instantly load the updated skills." -ForegroundColor Yellow
