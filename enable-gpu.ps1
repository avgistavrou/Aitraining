# Enable GPU for AmaDema Sandbox
# Run this script after Docker Desktop is started

Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  AmaDema Sandbox - GPU Enablement Script" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Check if Docker is running
Write-Host "[1/6] Checking Docker status..." -ForegroundColor Yellow
$dockerRunning = $false
$ErrorActionPreference = 'SilentlyContinue'
docker info > $null 2>&1
if ($LASTEXITCODE -eq 0) {
    $dockerRunning = $true
    Write-Host "✓ Docker Desktop is running" -ForegroundColor Green
}
$ErrorActionPreference = 'Continue'

if (-not $dockerRunning) {
    Write-Host "✗ Docker Desktop is not running" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please start Docker Desktop first, then run this script again." -ForegroundColor Yellow
    Write-Host "Look for the whale icon in your system tray." -ForegroundColor Yellow
    exit 1
}

# Check NVIDIA GPU
Write-Host ""
Write-Host "[2/6] Checking NVIDIA GPU..." -ForegroundColor Yellow
$ErrorActionPreference = 'SilentlyContinue'
$gpuInfo = nvidia-smi --query-gpu=name,memory.total --format=csv,noheader 2>$null
if ($LASTEXITCODE -eq 0 -and $gpuInfo) {
    Write-Host "✓ GPU detected: $gpuInfo" -ForegroundColor Green
}
elseif ($LASTEXITCODE -ne 0) {
    Write-Host "⚠ Warning: nvidia-smi not accessible" -ForegroundColor Yellow
    Write-Host "  GPU may still work in Docker, continuing..." -ForegroundColor Yellow
}
else {
    Write-Host "⚠ Warning: NVIDIA drivers may not be installed" -ForegroundColor Yellow
}
$ErrorActionPreference = 'Continue'

# Navigate to sandbox directory
Write-Host ""
Write-Host "[3/6] Navigating to sandbox directory..." -ForegroundColor Yellow
$sandboxPath = "$env:USERPROFILE\OneDrive - University of Bristol\Documents\AmaDema\Aitraining"
if (Test-Path $sandboxPath) {
    Set-Location $sandboxPath
    Write-Host "✓ Found sandbox at: $sandboxPath" -ForegroundColor Green
}
else {
    Write-Host "✗ Sandbox directory not found" -ForegroundColor Red
    Write-Host "  Expected location: $sandboxPath" -ForegroundColor Red
    exit 1
}

# Stop existing containers
Write-Host ""
Write-Host "[4/6] Stopping existing containers..." -ForegroundColor Yellow
docker-compose down 2>&1 | Out-Null
Write-Host "✓ Containers stopped" -ForegroundColor Green

# Start containers with GPU support
Write-Host ""
Write-Host "[5/6] Starting containers with GPU support..." -ForegroundColor Yellow
Write-Host "  This may take 2-3 minutes..." -ForegroundColor Gray
docker-compose up -d
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Containers started successfully" -ForegroundColor Green
}
else {
    Write-Host "✗ Failed to start containers" -ForegroundColor Red
    Write-Host "  Check docker-compose logs for details" -ForegroundColor Red
    exit 1
}

# Wait for services to be ready
Write-Host ""
Write-Host "  Waiting for services to initialize..." -ForegroundColor Gray
Start-Sleep -Seconds 30

# Verify GPU access in container
Write-Host ""
Write-Host "[6/6] Verifying GPU access..." -ForegroundColor Yellow

$ErrorActionPreference = 'SilentlyContinue'
$gpuCheck = docker exec amadema-ollama nvidia-smi --query-gpu=name --format=csv,noheader 2>&1

if ($LASTEXITCODE -eq 0 -and $gpuCheck) {
    Write-Host "✓ GPU accessible in container: $gpuCheck" -ForegroundColor Green
    
    # Check which models are loaded
    Write-Host ""
    Write-Host "Checking loaded models..." -ForegroundColor Yellow
    docker exec amadema-ollama ollama list
}
elseif ($LASTEXITCODE -ne 0) {
    Write-Host "⚠ GPU not accessible in container (falling back to CPU)" -ForegroundColor Yellow
    Write-Host "  The sandbox will still work, but slower." -ForegroundColor Yellow
    Write-Host "  See ENABLE_GPU_GUIDE.md for troubleshooting." -ForegroundColor Yellow
}
else {
    Write-Host "⚠ Could not verify GPU (may still be working)" -ForegroundColor Yellow
}

$ErrorActionPreference = 'Continue'

# Final summary
Write-Host ""
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Setup Complete!" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "Sandbox URL: http://localhost:3000" -ForegroundColor Green
Write-Host ""
Write-Host "To verify GPU performance:" -ForegroundColor White
Write-Host "  1. Open http://localhost:3000 in your browser" -ForegroundColor Gray
Write-Host "  2. Login with your credentials" -ForegroundColor Gray
Write-Host "  3. Ask a question and observe response time" -ForegroundColor Gray
Write-Host ""
Write-Host "Expected speed improvement:" -ForegroundColor White
Write-Host "  CPU: 3-8 seconds → GPU: 0.5-2 seconds ⚡" -ForegroundColor Green
Write-Host ""
Write-Host "Monitor GPU usage:" -ForegroundColor White
Write-Host "  docker exec amadema-ollama nvidia-smi" -ForegroundColor Gray
Write-Host ""
Write-Host "For detailed guide, see: ENABLE_GPU_GUIDE.md" -ForegroundColor Yellow
Write-Host ""
