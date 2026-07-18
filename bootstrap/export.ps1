$ErrorActionPreference = "Continue"

$projectRoot = (Get-Location).Path
$saipenDir = Join-Path -Path $projectRoot -ChildPath ".saipen"

if (-not (Test-Path $saipenDir)) {
    Write-Host "No .saipen directory found in $projectRoot."
    exit 1
}

$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$zipName = "saipen_export_$timestamp.zip"
$zipPath = Join-Path -Path $projectRoot -ChildPath $zipName

Write-Host "saipen state exporter"
Write-Host "------------------------------------------------------------"
Write-Host "Archiving: $saipenDir"
Compress-Archive -Path $saipenDir -DestinationPath $zipPath -Force
Write-Host "Done. Export saved to: $zipPath"
Write-Host "------------------------------------------------------------"
