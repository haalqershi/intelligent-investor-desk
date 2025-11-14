Write-Host "Starting infrastructure..." -ForegroundColor Green

Set-Location "..\docker"

docker-compose up -d

if ($LASTEXITCODE -eq 0) {
    Write-Host "Services started successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Service URLs:" -ForegroundColor Cyan
    Write-Host "  Eureka:    http://localhost:8761"
    Write-Host "  Config:    http://localhost:8888"
    Write-Host "  Grafana:   http://localhost:3000"
    Write-Host "  RabbitMQ:  http://localhost:15672"
    Write-Host "  Prometheus: http://localhost:9090"
} else {
    Write-Host "Failed to start services" -ForegroundColor Red
    exit 1
}

Set-Location "..\scripts"