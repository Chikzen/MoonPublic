# MoonPublic
cd d:\net
pnputil -i -a *.inf

start c:\soft\explorer\explorer++.exe



Get-ChildItem C:\Soft\Moon -Include *-strat.txt,*_edit.log –Recurse | Compress-Archive -DestinationPath C:\Soft\Moon\1.zip

& "C:\Program Files\Chromium\Application\chrome.exe"

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/install.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/cleaning.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/ROGER_DownloadMoonBot.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/RAMCPUPowerShell.ps1'))





# Get total number of processes
$totalProcesses = (Get-Process).Count

# Get CPU usage with error handling
try {
    $cpuUsage = [math]::Round((Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue, 2)
} catch {
    $cpuUsage = "N/A"
    Write-Host "Failed to retrieve CPU usage: $_"
}

# Get memory information
$mem = Get-CimInstance -ClassName 'Cim_OperatingSystem'
$usedMemoryPercentage = [math]::Round(($mem.TotalVisibleMemorySize - $mem.FreePhysicalMemory) / $mem.TotalVisibleMemorySize * 100, 2)
$freeMemoryPercentage = [math]::Round($mem.FreePhysicalMemory / $mem.TotalVisibleMemorySize * 100, 2)

# Output memory and CPU usage
Write-Host "Memory and CPU Usage:"
Write-Host "Used memory: $usedMemoryPercentage%"
Write-Host "Free memory: $freeMemoryPercentage%"
Write-Host "CPU Usage: $cpuUsage%"

# Get disk space usage
Write-Host "Disk Usage:"
Get-PSDrive | Where-Object {$_.Free -ne $null -and $_.Used -ne $null} | ForEach-Object {
    $freeSpaceGB = $_.Free / 1GB
    $usedSpaceGB = $_.Used / 1GB
    "{0}: {1:N2} GB free, {2:N2} GB used" -f $_.Name, $freeSpaceGB, $usedSpaceGB
}

# Output total processes
Write-Host "Total Processes: $totalProcesses"

# Get process information and sort by memory usage
Write-Host "Processes (sorted by memory usage):"
Get-Process | Select-Object Name,@{Name='Memory (MB)';Expression={[math]::Round(($_.WorkingSet / 1MB), 1)}},@{Name='CPU';Expression={[math]::Round($_.CPU, 1)}} | Sort-Object -Descending 'Memory (MB)'

