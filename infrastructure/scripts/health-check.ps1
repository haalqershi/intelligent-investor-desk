function Test-Service($name, $url) {
    try {
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop
        if ($response.StatusCode -eq 200) {
            Write-Host "$name : UP" -ForegroundColor Green
            return $true
        }
    } catch {
        Write-Host "$name : DOWN" -ForegroundColor Red
        return $false
    }
}

Write-Host "Health Check" -ForegroundColor Cyan

$allHealthy = $true
$allHealthy = $allHealthy -and (Test-Service "Eureka" "http://localhost:8761/actuator/health")
$allHealthy = $allHealthy -and (Test-Service "Config" "http://localhost:8888/actuator/health")
$allHealthy = $allHealthy -and (Test-Service "Prometheus" "http://localhost:9090/-/healthy")
$allHealthy = $allHealthy -and (Test-Service "Grafana" "http://localhost:3000/api/health")

if ($allHealthy) {
    Write-Host "All services healthy!" -ForegroundColor Green
    exit 0
} else {
    Write-Host "Some services down" -ForegroundColor Red
    exit 1
}