Write-Host "=========================================" -ForegroundColor Green
Write-Host "  Building All Services" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green

$services = @("eureka-server", "config-server")

foreach ($service in $services) {
    Write-Host "Building $service..." -ForegroundColor Yellow
    Set-Location "..\..\backend\$service"
    
    mvn clean package -DskipTests
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Success: $service built" -ForegroundColor Green
    } else {
        Write-Host "Failed: $service" -ForegroundColor Red
        exit 1
    }
}

Write-Host "All services built successfully!" -ForegroundColor Green