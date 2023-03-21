# MoonPublic
cd d:\net
pnputil -i -a *.inf

start c:\soft\explorer\explorer++.exe

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/ROGER_InstallSoftware.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/ROGER_DownloadMoonBot.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/install.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/install2.ps1'))

$totalProcesses = (Get-Process).Count
$cpuUsage = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
Write-Host "Total Processes: $totalProcesses"
Write-Host "CPU Usage: $cpuUsage%"
Get-Process | Select-Object Name,@{Name='Memory (MB)';Expression={[math]::Round(($_.WorkingSet / 1MB), 1)}},@{Name='CPU';Expression={[math]::Round($_.CPU, 1)}} | Sort-Object -Descending 'Memory (MB)'
