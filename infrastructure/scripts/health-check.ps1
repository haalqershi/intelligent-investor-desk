# Health Check Script
Write-Host "=== Service Health Check ===" -ForegroundColor Yellow
Write-Host ""

Write-Host "Docker Containers:" -ForegroundColor Yellow
Set-Location "..\docker"
docker-compose ps

Write-Host ""
Write-Host "Service Endpoints:" -ForegroundColor Yellow

# Function to check service
function Test-Service {
    param($name, $url)
    
    try {
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 5
        if ($response.StatusCode -eq 200) {
            Write-Host "$name : ✓ UP - $url" -ForegroundColor Green
        } else {
            Write-Host "$name : ✗ DOWN" -ForegroundColor Red
        }
    } catch {
        Write-Host "$name : ✗ DOWN" -ForegroundColor Red
    }
}

# Check services
Test-Service "Eureka Server   " "http://localhost:8761"
Test-Service "Config Server   " "http://localhost:8888/actuator/health"
Test-Service "RabbitMQ        " "http://localhost:15672"
Test-Service "Prometheus      " "http://localhost:9090"
Test-Service "Grafana         " "http://localhost:3000"
Test-Service "Jaeger          " "http://localhost:16686"

Write-Host ""