# Изменение часового пояса
$tmZone = "Russian Standard Time"
$WinOSVerReg = Get-Item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
$WinOSVer = $WinOSVerReg.GetValue("CurrentVersion")
if ($WinOSVer -GE 6){
tzutil.exe /s $tmZone
} Else {
$param = "/c Start `"Change tmZone`" /MIN %WINDIR%\System32\Control.exe TIMEDATE.CPL,,/Z "
$param += $tmZone
$proc = [System.Diagnostics.Process]::Start( "CMD.exe", $param )
}

# Открытие и смена RDP 
cscript C:\Windows\System32\Scregedit.wsf /ar 0
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\" -Name PortNumber -Value 31542
New-NetFirewallRule -DisplayName "RDP-31542" -Direction Inbound -LocalPort 31542 -Protocol TCP -Action allow
New-NetFirewallRule -DisplayName "RDP-31542" -Direction Inbound -LocalPort 31542 -Protocol UDP -Action allow
net stop termservice
net start termservice