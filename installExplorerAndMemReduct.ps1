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

function func_install_memreduct {
    $dir = "C:\Soft\MemReduct"
    $zipFile = "$dir\mem.zip"
    $exeFile = "memreduct.exe"
    $url = "https://github.com/Chikzen/MoonPublic/raw/344312d17a662814e552de6fca514c48b777b967/mem.zip"
    if(!(Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir
    }

    # Download the zip file
    Invoke-WebRequest -Uri $url -OutFile $zipFile

    # Extract the contents of the zip file
    Expand-Archive -Path mem.zip "C:\Soft\MemReduct"
    Remove-Item $zipFile

    # Run memreduct.exe
    cd $dir
    Start "$dir\$exeFile"
}
func_install_memreduct   


func_install_Explorer
start c:\Soft\Explorer\explorer++.exe
