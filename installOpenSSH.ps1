# Уcтановка, настройка и запуск OpenSSH
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install openssh -params '"/SSHServerFeature"'
refreshenv
#Enable-PSRemoting