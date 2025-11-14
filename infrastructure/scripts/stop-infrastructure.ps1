# Stop Infrastructure Script
Write-Host "Stopping Infrastructure Services..." -ForegroundColor Yellow

Set-Location "..\docker"
docker-compose down

Write-Host "Services stopped." -ForegroundColor Red