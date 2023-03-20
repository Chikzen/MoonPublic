# MoonPublic
cd d:\net
pnputil -i -a .*inf

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/ROGER_InstallSoftware.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/ROGER_DownloadMoonBot.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/install.ps1'))

iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Chikzen/MoonPublic/main/install2.ps1'))
