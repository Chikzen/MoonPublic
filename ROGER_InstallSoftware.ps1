### Set HTTPS - TLS 1.2 for this PowerShell session
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

### Install Chocolatey
Write-Host 'Installing Chocolatey...' -ForegroundColor Cyan
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=useRememberedArgumentsForUpgrades

### Install Chromium
Write-Host 'Installing Chromium...' -ForegroundColor Cyan
choco install chromium -y -r

### Install 7-Zip
Write-Host 'Installing 7-Zip...' -ForegroundColor Cyan
choco install 7zip -y -r
## Create handlers for archives
$ArchiveHandlers = @("'HKLM\SOFTWARE\Classes\.7z' /ve /d '7-Zip.7z' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.7z' /ve /d '7z Archive' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.7z\DefaultIcon' /ve /d 'C:\Program Files\7-Zip\7z.dll,0' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.7z\shell' /ve /f",
"'HKLM\SOFTWARE\Classes\7-Zip.7z\shell\open' /ve /f",
"'HKLM\SOFTWARE\Classes\7-Zip.7z\shell\open\command' /ve /d 'C:\Program Files\7-Zip\7zFM.exe %1' /f",
"'HKLM\SOFTWARE\Classes\.zip' /ve /d '7-Zip.zip' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.zip' /ve /d 'zip Archive' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.zip\DefaultIcon' /ve /d 'C:\Program Files\7-Zip\7z.dll,1' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.zip\shell' /ve /f",
"'HKLM\SOFTWARE\Classes\7-Zip.zip\shell\open' /ve /f",
"'HKLM\SOFTWARE\Classes\7-Zip.zip\shell\open\command' /ve /d 'C:\Program Files\7-Zip\7zFM.exe %1' /f",
"'HKLM\SOFTWARE\Classes\.rar' /ve /d '7-Zip.rar' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.rar' /ve /d 'rar Archive' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.rar\DefaultIcon' /ve /d 'C:\Program Files\7-Zip\7z.dll,3' /f",
"'HKLM\SOFTWARE\Classes\7-Zip.rar\shell' /ve /f",
"'HKLM\SOFTWARE\Classes\7-Zip.rar\shell\open' /ve /f",
"'HKLM\SOFTWARE\Classes\7-Zip.rar\shell\open\command' /ve /d 'C:\Program Files\7-Zip\7zFM.exe %1' /f")

foreach ($ArchiveHandlersObject in $ArchiveHandlers) {
  Invoke-Expression ("REG ADD " + $ArchiveHandlersObject) | Out-Null
}

### Install Mem Reduct
Write-Host 'Installing Mem Reduct...' -ForegroundColor Cyan
choco install memreduct -y -r
Stop-Process -Name 'memreduct' -Force

## Settings
$MemreductSettings = @'
[memreduct]
AutoreductEnable=true
AutoreductIntervalEnable=false
HotkeyCleanEnable=false
IsStartMinimized=true
IsShowReductConfirmation=false
CheckUpdatesPeriod=0
Language=English
IsNotificationsSound=false
'@

Set-Content -Path 'C:\Program Files\Mem Reduct\memreduct.ini' -Value $MemreductSettings
REG ADD 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run' /v 'Mem Reduct' /t REG_SZ /d '\"C:\Program Files\Mem Reduct\memreduct.exe\" -minimized' /f
Start-Process 'C:\Program Files\Mem Reduct\memreduct.exe' -ArgumentList '-minimized'

### Install Notepad3
Write-Host 'Installing Notepad3...' -ForegroundColor Cyan
choco install notepad3 -y -r

### Install IPBan
#Write-Host 'Installing IPBan...' -ForegroundColor Cyan
#$ScriptPath = ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/DigitalRuby/IPBan/master/IPBanCore/Windows/Scripts/install_latest.ps1'))
#Invoke-Command -ScriptBlock ([scriptblock]::Create($ScriptPath)) -Args "silent", $true

switch (Read-Host 'Restart computer now? [y/n]') {
    y { Restart-computer -Force -Confirm:$false }
    n { Write-Host 'Restart cancelled...' -ForegroundColor Yellow -NoNewline }
    default { Write-Warning 'Invalid input...' }
}
