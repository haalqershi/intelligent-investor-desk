# Start Infrastructure Script
Write-Host "=== Starting Infrastructure Services ===" -ForegroundColor Green

Set-Location "..\docker"

Write-Host "Building Docker images..." -ForegroundColor Yellow
docker-compose build

Write-Host "Starting services..." -ForegroundColor Yellow
docker-compose up -d

Write-Host ""
Write-Host "Services started! Waiting for health checks..." -ForegroundColor Green
Start-Sleep -Seconds 10

Write-Host ""
Write-Host "=== Service URLs ===" -ForegroundColor Green
Write-Host "Eureka Server:    http://localhost:8761" -ForegroundColor Yellow
Write-Host "Config Server:    http://localhost:8888" -ForegroundColor Yellow
Write-Host "PostgreSQL:       localhost:5432" -ForegroundColor Yellow
Write-Host "Redis:            localhost:6379" -ForegroundColor Yellow
Write-Host "RabbitMQ:         http://localhost:15672 (investordesk/dev_password_2024)" -ForegroundColor Yellow
Write-Host "Prometheus:       http://localhost:9090" -ForegroundColor Yellow
Write-Host "Grafana:          http://localhost:3000 (admin/admin_password_2024)" -ForegroundColor Yellow
Write-Host "Jaeger:           http://localhost:16686" -ForegroundColor Yellow
Write-Host ""
Write-Host "Check service health: docker-compose ps" -ForegroundColor Yellow