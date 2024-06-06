# Define the root directory name with the current date
$today = Get-Date -Format "yyyy-MM-dd"
$rootDir = "C:\Incident_$today"
# Create the root directory if it doesn't exist
New-Item -Path $rootDir -ItemType Directory -Force



# Create a subdirectory for 'Computer Info'
$computerInfoDir = Join-Path -Path $rootDir -ChildPath "Computer Info"
New-Item -Path $computerInfoDir -ItemType Directory -Force

# Run Get-ComputerInfo and output to a file
$computerInfoFile = Join-Path -Path $computerInfoDir -ChildPath "ComputerInfo.txt"
Get-ComputerInfo | Out-File -FilePath $computerInfoFile



# Create a subdirectory for 'User Accounts'
$userAccountsDir = Join-Path -Path $rootDir -ChildPath "User Accounts"
New-Item -Path $userAccountsDir -ItemType Directory -Force

# Run Get-LocalUser and output to a file
$localUserFile = Join-Path -Path $userAccountsDir -ChildPath "LocalUsers.txt"
Get-LocalUser | Out-File -FilePath $localUserFile

# Run Get-LocalGroupMember for Administrators group and output to a file
$groupMemberFile = Join-Path -Path $userAccountsDir -ChildPath "AdministratorsGroupMembers.txt"
Get-LocalGroupMember -Group "Administrators" | Out-File -FilePath $groupMemberFile



# Create a subdirectory for 'Processes & Services'
$procServDir = Join-Path -Path $rootDir -ChildPath "Processes & Services"
New-Item -Path $procServDir -ItemType Directory -Force

# Run Tasklist /svc and output to a file
$tasklistFile = Join-Path -Path $procServDir -ChildPath "TasklistSvc.txt"
tasklist /svc | Out-File -FilePath $tasklistFile

# Run wmic process list full and output to a file
$wmicFile = Join-Path -Path $procServDir -ChildPath "WMICProcessList.txt"
wmic process list full | Out-File -FilePath $wmicFile

# Run Get-Process with CPU sorting and output to a file
$getProcessFile = Join-Path -Path $procServDir -ChildPath "SortedProcessesByCPU.txt"
Get-Process -IncludeUserName | Sort-Object CPU -Descending | Format-Table -AutoSize | Out-File -FilePath $getProcessFile



# Create a subdirectory for 'Network Activity'
$networkActivityDir = Join-Path -Path $rootDir -ChildPath "Network Activity"
New-Item -Path $networkActivityDir -ItemType Directory -Force

# Run 'net view' and output to a file
$netViewFile = Join-Path -Path $networkActivityDir -ChildPath "NetView.txt"
net view \\127.0.0.1 | Out-File -FilePath $netViewFile

# Run 'net session' and output to a file
$netSessionFile = Join-Path -Path $networkActivityDir -ChildPath "NetSession.txt"
net session | Out-File -FilePath $netSessionFile

# Run 'net use' and output to a file
$netUseFile = Join-Path -Path $networkActivityDir -ChildPath "NetUse.txt"
net use | Out-File -FilePath $netUseFile

# Run Get-NetUDPEndpoint and output to a file
$udpEndpointFile = Join-Path -Path $networkActivityDir -ChildPath "UDPEndpoints.txt"
Get-NetUDPEndpoint | Where-Object {$_.OwningProcess -ne 0} | Format-Table -AutoSize | Out-File -FilePath $udpEndpointFile

# Run Get-NetTCPConnection and output to a file
$tcpConnectionFile = Join-Path -Path $networkActivityDir -ChildPath "TCPConnections.txt"
Get-NetTCPConnection | Select local*, remote*, state, @{Name="Process";Expression={(Get-Process -Id $_.OwningProcess).ProcessName}} | Format-Table -AutoSize | Out-File -FilePath $tcpConnectionFile



# Create a subdirectory for 'Startup Programs & Scheduled Tasks'
$startupTasksDir = Join-Path -Path $rootDir -ChildPath "Startup Programs & Scheduled Tasks"
New-Item -Path $startupTasksDir -ItemType Directory -Force

# Run 'schtasks' to list scheduled tasks and output to a file
$scheduledTasksFile = Join-Path -Path $startupTasksDir -ChildPath "ScheduledTasks.txt"
schtasks /query /fo LIST | Out-File -FilePath $scheduledTasksFile

# Run Get-CimInstance to get startup commands and output to a file
$startupCommandsFile = Join-Path -Path $startupTasksDir -ChildPath "StartupCommands.txt"
Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location, User | Format-List | Out-File -FilePath $startupCommandsFile



# Create a subdirectory for 'Firewall Status'
$firewallDir = Join-Path -Path $rootDir -ChildPath "Firewall Status"
New-Item -Path $firewallDir -ItemType Directory -Force

# Run Get-NetFirewallProfile to get firewall profiles and output to a file
$firewallProfileFile = Join-Path -Path $firewallDir -ChildPath "FirewallStatus.txt"
Get-NetFirewallProfile | Format-Table -AutoSize | Out-File -FilePath $firewallProfileFile
