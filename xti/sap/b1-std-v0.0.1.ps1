$services = @(
    "1434", # SQL
    "1434", # SQL 
    "30000",  # SLD
    #"30010",  # SLD din to pero di daw kailangan
    "40000", # License manager
    "40020", # Authentication servce
    "8100" # Dispatcher
)

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
$sapports = "1433-1434,30000"
New-NetFirewallRule -DisplayName "allow-sap-ports-tcp" -Direction Inbound -Action Allow -EdgeTraversalPolicy Allow -Protocol TCP -LocalPort @sapports
