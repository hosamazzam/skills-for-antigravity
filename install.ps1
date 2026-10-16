# Automated Installer for Antigravity Skills (Windows)
# Usage: powershell -ExecutionPolicy Bypass -File install.ps1

$ErrorActionPreference = "Stop"

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "   Installing Skills for Google Antigravity (Windows)   " -ForegroundColor Cyan
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
    Write-Host "-> Installing skill: [$($skill.Name)]..." -ForegroundColor Green
    Copy-Item -Path $skill.FullName -Destination $dest -Recurse -Force
}

$sourceGlobalRule = Join-Path $PSScriptRoot "GEMINI.md"
if (Test-Path $sourceGlobalRule) {
    if (-not (Test-Path $targetGlobalRule)) {
        Write-Host "-> Creating global rules file: $targetGlobalRule..." -ForegroundColor Green
        Copy-Item -Path $sourceGlobalRule -Destination $targetGlobalRule -Force
    } else {
        Write-Host "-> Target GEMINI.md already exists. Checking for updates..." -ForegroundColor Yellow
        $existingContent = Get-Content -Path $targetGlobalRule -Raw
        $newContent = Get-Content -Path $sourceGlobalRule -Raw
        if ($existingContent -notmatch "usage-report") {
            Write-Host "-> Appending /usage and /session-summary rules to GEMINI.md..." -ForegroundColor Green
            Add-Content -Path $targetGlobalRule -Value "`n`n$newContent"
        } else {
            Write-Host "-> GEMINI.md already contains usage rules. Updated!" -ForegroundColor DarkGray
        }
    }
}

Write-Host "`n✅ Successfully installed all skills!" -ForegroundColor Cyan
Write-Host "You can now use /usage and /session-summary in any Antigravity conversation." -ForegroundColor White
