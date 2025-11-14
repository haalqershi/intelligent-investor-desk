Write-Host "=== Development Setup ===" -ForegroundColor Green

Write-Host "Step 1: Build services" -ForegroundColor Yellow
.\build-all.ps1 -SkipTests

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed" -ForegroundColor Red
    exit 1
}

Write-Host "Step 2: Start infrastructure" -ForegroundColor Yellow
.\start-infrastructure.ps1

if ($LASTEXITCODE -ne 0) {
    Write-Host "Start failed" -ForegroundColor Red
    exit 1
}

Write-Host "Step 3: Wait for services" -ForegroundColor Yellow
Start-Sleep -Seconds 60

Write-Host "Step 4: Health check" -ForegroundColor Yellow
.\health-check.ps1

Write-Host ""
Write-Host "Setup complete!" -ForegroundColor Green
Write-Host "Eureka: http://localhost:8761" -ForegroundColor Cyan
Write-Host "Config: http://localhost:8888" -ForegroundColor Cyan
Write-Host "Grafana: http://localhost:3000" -ForegroundColor Cyan