# Development Setup Script
Write-Host "=== Intelligent Investor Desk - Development Setup ===" -ForegroundColor Green
Write-Host ""

# Check prerequisites
Write-Host "Checking prerequisites..." -ForegroundColor Yellow

$javaVersion = java -version 2>&1
$mavenVersion = mvn -version 2>&1
$dockerVersion = docker --version 2>&1

if ($javaVersion -match "openjdk") {
    Write-Host "✓ Java installed" -ForegroundColor Green
} else {
    Write-Host "✗ Java not found. Please install Java 17" -ForegroundColor Red
    exit 1
}

if ($mavenVersion -match "Apache Maven") {
    Write-Host "✓ Maven installed" -ForegroundColor Green
} else {
    Write-Host "✗ Maven not found. Please install Maven" -ForegroundColor Red
    exit 1
}

if ($dockerVersion -match "Docker version") {
    Write-Host "✓ Docker installed" -ForegroundColor Green
} else {
    Write-Host "✗ Docker not found. Please install Docker Desktop" -ForegroundColor Red
    exit 1
}

Write-Host ""

# Build services
Write-Host "Building services..." -ForegroundColor Yellow
.\build-all.ps1

Write-Host ""

# Start infrastructure
Write-Host "Starting infrastructure..." -ForegroundColor Yellow
.\start-infrastructure.ps1

Write-Host ""
Write-Host "=== Setup Complete! ===" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Wait for services to be healthy: docker-compose ps"
Write-Host "2. Check Eureka dashboard: http://localhost:8761"
Write-Host "3. Start developing your microservices!"
Write-Host ""