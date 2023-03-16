#Установка и запуск Explorer++
New-Item -Path 'C:\Soft\Explorer\' -ItemType Directory
function func_install_Explorer {
    Write-Host Install Explorer -ForegroundColor Green -BackgroundColor Black
    if (-Not (Test-Path -Path "C:\Soft\Explorer\Explorer++.exe" -PathType Leaf)) {
        if (-Not (Test-Path explorerpp_x64.zip -PathType Leaf)) {
            Write-Host Download Explorer -ForegroundColor Cyan
            Invoke-WebRequest -O explorerpp_x64.zip "https://github.com/derceg/explorerplusplus/releases/download/version-1.4.0-beta-2/explorerpp_x64.zip"
        }
        if (Test-Path explorerpp_x64.zip -PathType Leaf) {
            Expand-Archive -Path explorerpp_x64.zip "C:\Soft\Explorer"
            Remove-Item .\explorerpp_x64.zip
        }
    }
}

# Функция установки MemReduct
function func_install_MemReduct
{   Write-Host Install MemReduct -ForegroundColor Green -BackgroundColor Black
    if (-Not (Test-Path -Path "C:\Soft\MemReduct\memreduct.exe" -PathType Leaf)) {
        if (-Not (Test-Path mem.zip -PathType Leaf)) {
            Write-Host Download MemReduct -ForegroundColor Cyan
            Invoke-WebRequest -O mem.zip "https://github.com/Chikzen/MoonPublic/blob/2822c3b84c03e8891e55d13e59ec5d324ff38ceb/mem.zip"
        }
        if (Test-Path mem.zip -PathType Leaf) {
            Expand-Archive -Path mem.zip "C:\Soft"
            #Remove-Item .\mem.zip
        }
    }
} 
    
# Установка MemReduct
func_install_MemReduct
Start C:\Soft\MemReduct\memreduct.exe
func_install_Explorer
start c:\Soft\Explorer\explorer++.exe
