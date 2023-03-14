#Установка и запуск Explorer++
New-Item -Path 'C:\Explorer\' -ItemType Directory
function func_install_Explorer {
    Write-Host Install Explorer -ForegroundColor Green -BackgroundColor Black
    if (-Not (Test-Path -Path "C:\Explorer\Explorer++.exe" -PathType Leaf)) {
        if (-Not (Test-Path explorerpp_x64.zip -PathType Leaf)) {
            Write-Host Download Explorer -ForegroundColor Cyan
            Invoke-WebRequest -O explorerpp_x64.zip "https://github.com/derceg/explorerplusplus/releases/download/version-1.4.0-beta-2/explorerpp_x64.zip"
        }
        if (Test-Path IpBan.zip -PathType Leaf) {
            Expand-Archive -Path explorerpp_x64.zip "C:\Program Files\IpBan"
            Remove-Item .\explorerpp_x64.zip
        }
    }
}
func_install_Explorer
start c:\Explorer\explorer++.exe