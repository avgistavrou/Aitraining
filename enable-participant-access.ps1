# Enable Participant Access to Sandbox
# Run this as Administrator (Right-click → Run as Administrator)

Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Enable Participant Access" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "✗ This script must run as Administrator" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please:" -ForegroundColor Yellow
    Write-Host "  1. Close this window" -ForegroundColor Gray
    Write-Host "  2. Right-click on enable-participant-access.ps1" -ForegroundColor Gray
    Write-Host "  3. Select 'Run with PowerShell as Administrator'" -ForegroundColor Gray
    Write-Host ""
    pause
    exit 1
}

Write-Host "✓ Running as Administrator" -ForegroundColor Green
Write-Host ""

# Add firewall rule
Write-Host "Adding Windows Firewall rule..." -ForegroundColor Yellow

$ErrorActionPreference = 'Stop'

$existingRule = Get-NetFirewallRule -DisplayName "AmaDema AI Sandbox" -ErrorAction SilentlyContinue

if ($existingRule) {
    Write-Host "⚠ Firewall rule already exists, removing old rule..." -ForegroundColor Yellow
    Remove-NetFirewallRule -DisplayName "AmaDema AI Sandbox"
}

New-NetFirewallRule -DisplayName "AmaDema AI Sandbox" `
    -Direction Inbound `
    -LocalPort 3000 `
    -Protocol TCP `
    -Action Allow `
    -Profile Any `
    -Enabled True | Out-Null

Write-Host "✓ Firewall rule created successfully" -ForegroundColor Green
Write-Host ""

# Get IP address
Write-Host "Getting your IP address..." -ForegroundColor Yellow
$ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike "*Loopback*" -and $_.IPAddress -like "192.168.*"}).IPAddress

if (-not $ip) {
    $ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -notlike "*Loopback*"} | Select-Object -First 1).IPAddress
}

Write-Host "✓ Your IP address: $ip" -ForegroundColor Green
Write-Host ""

# Summary
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "  Participant Access Enabled!" -ForegroundColor Cyan
Write-Host "═══════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "Share this URL with participants:" -ForegroundColor White
Write-Host "  http://${ip}:3000" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "  1. Create participant accounts (see ADD_PARTICIPANTS.md)" -ForegroundColor Gray
Write-Host "  2. Send access emails (see PARTICIPANT_EMAIL_TEMPLATE.txt)" -ForegroundColor Gray
Write-Host "  3. Test with one participant before training" -ForegroundColor Gray
Write-Host ""
Write-Host "To verify firewall:" -ForegroundColor Yellow
Write-Host "  Get-NetFirewallRule -DisplayName 'AmaDema AI Sandbox'" -ForegroundColor Gray
Write-Host ""

pause
