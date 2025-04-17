Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

$services = @(
    "FDResPub", # Function Discovery Resource Publication
    "Dnscache", # DNS Client
    "SSDPSRV",  # SSDP Discovery
    "upnphost"  # UPnP
)

# Enable every services for discovery of SAP server, currently encountering a permission error if ran in windows 11
foreach ($service in $services) {
    Write-Host "Enabling Services $service"
    Set-Service -Name $service -StartupType Automatic -Status Running   
}

# Create Inbound Firewall Rule
$sapports = @(
    "1433", # SQL
    "1434", # SQL 
    "40000", # License manager
    "40020", # Authentication service
    # "8100" # Browser Access
    "443" # Web Client
)

if ($rule){
    Write-Host("No need to create")
} else {
    New-NetFirewallRule -DisplayName "allow-sap-ports-tcp" -Direction Inbound -Action Allow -Protocol TCP -LocalPort $sapports
    New-NetFirewallRule -DisplayName "allow-sap-ports-udp" -Direction Inbound -Action Allow -Protocol UDP -LocalPort $sapports
}
