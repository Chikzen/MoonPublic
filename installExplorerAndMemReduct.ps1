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

function func_install_MemReduct {
    $dir = "C:\Soft\Memreduct"
    if(!(Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir
    }
    $url = "https://github.com/Chikzen/MoonPublic/raw/344312d17a662814e552de6fca514c48b777b967/mem.zip"
    $zipFile = "$destination\mem.zip"
    $exeFile = "$destination\memreduct.exe"

    # Download the zip file
    Invoke-WebRequest -Uri $url -OutFile $zipFile

    # Extract the contents of the zip file
    Expand-Archive -Path $zipFile -DestinationPath $dir -Force

    # Run memreduct.exe
    cd $dir
    Start-Process -FilePath $exeFile
}
    
func_install_Explorer
start c:\Soft\Explorer\explorer++.exe
