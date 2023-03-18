# Уcтановка и запуск MemReduct
#Write-Host Download MemReduct -ForegroundColor Green -BackgroundColor Black
#Invoke-WebRequest -outfile 'c:\soft\mem.zip' #"https://github.com/Chikzen/MoonPublic/raw/271589be4712d81503072d258cd399466df2a310/Mem.zip"
#Expand-Archive c:\soft\mem.zip
#Remove-Item c:\soft\mem.zip
#Start-Process -FilePath "memreduct.exe" -WorkingDirectory 'C:\Soft\MemReduct'



# Функция установки MemReduct
function func_install_MemReduct
{   Write-Host Install MemReduct -ForegroundColor Green -BackgroundColor Black
    if (-Not (Test-Path -Path "C:\Soft\MemReduct\memreduct.exe" -PathType Leaf)) {
        if (-Not (Test-Path mem.zip -PathType Leaf)) {
            Write-Host Download MemReduct -ForegroundColor Cyan
            Invoke-WebRequest -O mem.zip "https://github.com/Chikzen/MoonPublic/raw/26e5b6e8859c420aeea06598d406f51cd01941dd/mem.zip"
        }
        if (Test-Path mem.zip -PathType Leaf) {
            Expand-Archive -Path mem.zip "C:\Soft"
            Remove-Item .\mem.zip
        }
    }
} 
    
# Установка MoonBot
func_install_MemReduct
