# Build All Services Script
Write-Host "=== Building Intelligent Investor Desk ===" -ForegroundColor Green

function Build-Service {
    param($serviceName)
    
    Write-Host "Building $serviceName..." -ForegroundColor Yellow
    Set-Location "..\..\backend\$serviceName"
    
    mvn clean package -DskipTests
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ $serviceName built successfully" -ForegroundColor Green
    } else {
        Write-Host "✗ $serviceName build failed" -ForegroundColor Red
        exit 1
    }
}

# Build services
Build-Service "eureka-server"
Build-Service "config-server"

Write-Host "=== All services built successfully! ===" -ForegroundColor Green