# MoonPublic
cd d:\net
pnputil -i -a *.inf

start c:\soft\explorer\explorer++.exe

https://user:samantafox@mypkeen.keenetic.link/webdav/1.iso


Get-ChildItem C:\Soft\Moon -Include *-strat.txt,*_edit.log –Recurse | Compress-Archive -DestinationPath C:\Soft\Moon\1.zip

& "C:\Program Files\Chromium\Application\chrome.exe"

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
Get-PSDrive | Where-Object {$_.Free -ne $null -and $_.Used -ne $null} | ForEach-Object { 
    $freeSpaceGB = $_.Free / 1GB
    $usedSpaceGB = ($_.Used / 1GB)
    "{0}: {1:N2} GB free, {2:N2} GB used" -f $_.Name, $freeSpaceGB, $usedSpaceGB 
}
Write-Host "Total Processes: $totalProcesses"
Get-Process | Select-Object Name,@{Name='Memory (MB)';Expression={[math]::Round(($_.WorkingSet / 1MB), 1)}},@{Name='CPU';Expression={[math]::Round($_.CPU, 1)}} | Sort-Object -Descending 'Memory (MB)'


Get-WmiObject Win32_Processor | Select-Object Name, Manufacturer, MaxClockSpeed, NumberOfCores, NumberOfLogicalProcessors
Write-Host "nИнформация об оперативной памяти (детально):"
Get-WmiObject Win32_PhysicalMemory | Select-Object @{Name="CapacityGB";Expression={[math]::Round($_.Capacity / 1Gb, 1)}}, Speed

Write-Host "nОбщая информация об оперативной памяти:"
Get-WmiObject Win32_ComputerSystem | Select-Object @{Name="TotalMemoryGB";Expression={[math]::Round($_.TotalPhysicalMemory / 1Gb, 1)}}
Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, MediaType, @{Name="SizeGB";Expression={[math]::Round($_.Size / 1Gb, 1)}}, @{Name="FreeSpaceGB";Expression={[math]::Round($_.FreeSpace / 1Gb, 1)}}


# Инициализация нового диска
diskpart

list disk

select disk [номер диска]

create partition primary

select partition 1

format fs=ntfs quick

assign letter=[буква диска]

exit

# Указываем URL для скачивания сертификата
$url = 'https://www.amazontrust.com/repository/AmazonRootCA1.pem'

# Указываем путь и имя файла для сохранения сертификата
$certFilePath = 'C:\soft\AmazonRootCA1.pem'

# Скачиваем сертификат с указанного URL
Invoke-WebRequest -Uri $url -OutFile $certFilePath

# Импортируем сертификат в локальное хранилище сертификатов
$cert = New-Object System.Security.Cryptography.X509Certificates.X509Certificate2
$cert.Import($certFilePath)
$store = New-Object System.Security.Cryptography.X509Certificates.X509Store -ArgumentList "Root", "LocalMachine"
$store.Open([System.Security.Cryptography.X509Certificates.OpenFlags]::ReadWrite)
$store.Add($cert)
$store.Close()
