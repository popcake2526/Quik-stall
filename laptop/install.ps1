Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Remove-Item -Path "%LOCALAPPDATA%\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState"
winget source reset --force
winget source -add -n winget -a "https://cdb.winget.microsoft.com/cache"
winget source update

# List of apps i want to install
$apps = @(
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "Microsoft.Teams",
    "Microsoft.PowerShell"
    "Brave.Brave",
    "Google.Chrome",
    "Google.ChromeRemoteDesktop",
    "Bitwarden.Bitwarden",
    "Notion.Notion",
    "Git.Git",
    "Microsoft.PowerShell.Preview",
    "Viber.Viber",
    "tailscale.tailscale",
    "Microsoft.VCRedist.2015+.x64",
    "7zip.7zip",
    "Microsoft.SQLServerManagementStudio"
)

# Install every app
foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install --id=$app --silent --accept-source-agreements --accept-package-agreements
}

Write-Host "All applications have been installed!"
