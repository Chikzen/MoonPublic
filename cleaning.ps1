# Видалення тимчасових файлів
Get-ChildItem -Path "$env:TEMP\*" -Recurse | ForEach-Object { Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue }

# Очищення тимчасових файлів Windows
Get-ChildItem -Path "C:\Windows\Temp\*" -Recurse | ForEach-Object { Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue }

# Видалення файлів журналів
Get-ChildItem -Path "C:\Windows\Logs\*" -Recurse | ForEach-Object { Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue }

# Очищення кешу Windows Update
Stop-Service -Name wuauserv -Force
Get-ChildItem -Path "C:\Windows\SoftwareDistribution\Download\*" -Recurse | ForEach-Object { Remove-Item $_.FullName -Recurse -Force -ErrorAction SilentlyContinue }
#Start-Service -Name wuauserv

# Видалення старих точок відновлення (запуск від імені адміністратора)
vssadmin delete shadows /for=C: /all /quiet

# Видалення не потрібних пакетів
dism.exe /online /cleanup-image /startcomponentcleanup /resetbase

cd C:\Soft\NodeJsProg
npm init -y
npm install express basic-auth sqlite3 qckwinsvc fs-extra express-basic-auth axios 
