# MoonPublic
cd d:\net
pnputil -i -a *.inf

start c:\soft\explorer\explorer++.exe

start C:\Program Files\Chromium\Application\chrome.exe

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/install.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/ROGER_DownloadMoonBot.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://awscli.amazonaws.com/AWSCLIV2.msi'))



$totalProcesses = (Get-Process).Count
$cpuUsage = [math]::Round((Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue, 2)
$mem = Get-CimInstance -ClassName 'Cim_OperatingSystem'
$usedMemoryPercentage = [math]::Round(($mem.TotalVisibleMemorySize - $mem.FreePhysicalMemory) / $mem.TotalVisibleMemorySize * 100, 2)
$freeMemoryPercentage = [math]::Round($mem.FreePhysicalMemory / $mem.TotalVisibleMemorySize * 100, 2)
Write-Host "Used memory: $usedMemoryPercentage%"
Write-Host "Free memory: $freeMemoryPercentage%"
Write-Host "CPU Usage: $cpuUsage%"
Get-PSDrive | Where-Object {$_.Free -ne $null -and $_.Used -ne $null} | ForEach-Object { "{0}: {1:N2} GB free" -f $_.Name, ($_.Free/1GB) }
Write-Host "Total Processes: $totalProcesses"
Get-Process | Select-Object Name,@{Name='Memory (MB)';Expression={[math]::Round(($_.WorkingSet / 1MB), 1)}},@{Name='CPU';Expression={[math]::Round($_.CPU, 1)}} | Sort-Object -Descending 'Memory (MB)'

