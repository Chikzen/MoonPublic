# Получение и вывод загрузки процессора
$cpuLoad = Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select Average
Write-Host "Загрузка процессора: $($cpuLoad.Average)%"

# Вывод списка всех процессов с использованием CPU и RAM, ID колонка убрана
Write-Host "Список всех процессов с использованием CPU и RAM:"
Get-Process | ForEach-Object {
    $_ | Add-Member -Type NoteProperty -Name CPU_Usage -Value ([math]::Round($_.CPU, 1))
    $_ | Add-Member -Type NoteProperty -Name RAM_Usage -Value ([math]::Round($_.WS / 1MB, 1))
    $_
} | Sort-Object CPU -Descending | Format-Table ProcessName, CPU_Usage, RAM_Usage -AutoSize

# Получение и вывод информации о свободном и занятом месте на диске C
$diskC = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size,FreeSpace
$freeSpaceGB = [math]::round($diskC.FreeSpace / 1GB, 2)
$totalSizeGB = [math]::round($diskC.Size / 1GB, 2)
$usedSpaceGB = $totalSizeGB - $freeSpaceGB
Write-Host "Диск C: Всего места: $totalSizeGB GB, Занято: $usedSpaceGB GB, Свободно: $freeSpaceGB GB"

# Получение и вывод общего и используемого объема оперативной памяти
$ram = Get-WmiObject Win32_ComputerSystem
$totalRAM = [math]::round($ram.TotalPhysicalMemory / 1GB, 2)
$usedRAM = [math]::round(($ram.TotalPhysicalMemory - (Get-WmiObject Win32_OperatingSystem).FreePhysicalMemory*1024) / 1GB, 2)
Write-Host "Total $totalRAM GB, Used $usedRAM GB"

