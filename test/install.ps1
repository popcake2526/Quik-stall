# Make sure winget is available - this will force install winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget is not installed. Please install it first."
    exit
}

# List of apps i want to install
$apps = @(
    "Google.Chrome",
    "Mozilla.Firefox",
    "7zip.7zip",
    "Microsoft.PowerShell"
)

# Install every app
foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install --id=$app --silent --accept-source-agreements --accept-package-agreements
}

Write-Host "All applications have been installed!"