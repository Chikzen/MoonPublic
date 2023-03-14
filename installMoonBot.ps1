# Функция установки MoonBot
function func_install_MoonBot 
{   Write-Host Install MoonBot -ForegroundColor Green -BackgroundColor Black
    if (-Not (Test-Path -Path "C:\Soft\Moon\MoonBot.exe" -PathType Leaf)) {
        if (-Not (Test-Path MoonBot.zip -PathType Leaf)) {
            Write-Host Download MoonBot -ForegroundColor Cyan
            Invoke-WebRequest -O MoonBot.zip "https://moon-bot.com/files/MoonBot.zip"
        }
        if (Test-Path MoonBot.zip -PathType Leaf) {
            Expand-Archive -Path MoonBot.zip "C:\Soft\Moon"
            Remove-Item .\MoonBot.zip
        }
    }
} 
    
# Установка MoonBot
func_install_MoonBot
