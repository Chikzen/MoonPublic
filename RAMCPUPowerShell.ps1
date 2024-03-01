$cpuLoad = Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average
Get-Process | ForEach-Object {
    $_ | Add-Member -Type NoteProperty -Name CPU_Usage -Value ([math]::Round($_.CPU, 1))
    $_ | Add-Member -Type NoteProperty -Name RAM_Usage -Value ([math]::Round($_.WS / 1MB, 1))
    $_
} | Sort-Object CPU -Descending | Format-Table ProcessName, CPU_Usage, RAM_Usage -AutoSize
$diskC = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size,FreeSpace
$freeSpaceGB = [math]::round($diskC.FreeSpace / 1GB, 2)
$totalSizeGB = [math]::round($diskC.Size / 1GB, 2)
$usedSpaceGB = $totalSizeGB - $freeSpaceGB
Write-Host "All: $totalSizeGB GB, Used: $usedSpaceGB GB, Free: $freeSpaceGB GB"
$ram = Get-WmiObject Win32_ComputerSystem
$totalRAM = [math]::round($ram.TotalPhysicalMemory / 1GB, 2)
$usedRAM = [math]::round(($ram.TotalPhysicalMemory - (Get-WmiObject Win32_OperatingSystem).FreePhysicalMemory*1024) / 1GB, 2)
Write-Host "Total $totalRAM GB, Used $usedRAM GB, CPU $($cpuLoad.Average)%"

