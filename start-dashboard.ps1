# Start local server for the HTML sales dashboard
$root = $PSScriptRoot
$data = Join-Path $root "data\sales_data.csv"
$standalone = Join-Path $root "sales-dashboard-standalone.html"

if (-not (Test-Path $data)) {
    Write-Host "Data file missing. Opening standalone dashboard instead."
    Start-Process $standalone
    exit 0
}

$port = 8080
Set-Location $root
Write-Host "Sales dashboard: http://localhost:$port/"
Write-Host "Press Ctrl+C to stop."
Start-Process "http://localhost:$port/"

python -m http.server $port 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Python not found. Opening standalone dashboard."
    Start-Process $standalone
}
