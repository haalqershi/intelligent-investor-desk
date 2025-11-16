Write-Host "Building all services..." -ForegroundColor Green

# Navigate to backend directory
Set-Location "..\..\backend"

# Build all modules from parent POM
Write-Host "`nBuilding all modules from parent POM..." -ForegroundColor Cyan
mvn clean package -DskipTests

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed" -ForegroundColor Red
    Set-Location "..\infrastructure\scripts"
    exit 1
}

Write-Host "`nAll services built successfully!" -ForegroundColor Green

# Return to scripts directory
Set-Location "..\infrastructure\scripts"