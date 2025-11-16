Write-Host "Deploying to Docker..." -ForegroundColor Green

# Check .env exists in docker directory
if (-not (Test-Path "..\docker\.env")) {
    Write-Host "ERROR: .env file not found in infrastructure/docker/" -ForegroundColor Red
    exit 1
}

# Build services first
Write-Host "`nStep 1: Building services..." -ForegroundColor Yellow
Set-Location "..\..\backend"
mvn clean package -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed" -ForegroundColor Red
    Set-Location "..\infrastructure\scripts"
    exit 1
}

Write-Host "Build successful!" -ForegroundColor Green
Set-Location "..\infrastructure\scripts"

# Navigate to docker directory
Set-Location "..\docker"

# Stop existing containers
Write-Host "`nStep 2: Stopping existing containers..." -ForegroundColor Yellow
docker-compose down

# Build and start with docker-compose
Write-Host "`nStep 3: Building Docker images and starting containers..." -ForegroundColor Yellow
docker-compose --env-file .env up -d --build

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nDeployment successful!" -ForegroundColor Green
    Write-Host "`nServices:" -ForegroundColor Cyan
    Write-Host "  Eureka:      http://localhost:8761"
    Write-Host "  Config:      http://localhost:8888"
    Write-Host "  User API:    http://localhost:8081"
    Write-Host "  Swagger UI:  http://localhost:8081/swagger-ui.html"
    Write-Host "  Prometheus:  http://localhost:9090"
    Write-Host "  Grafana:     http://localhost:3000"
    Write-Host "  RabbitMQ:    http://localhost:15672"
    Write-Host "  Jaeger:      http://localhost:16686"
} else {
    Write-Host "`nDeployment failed" -ForegroundColor Red
    docker-compose logs user-service
    exit 1
}

Set-Location "..\scripts"