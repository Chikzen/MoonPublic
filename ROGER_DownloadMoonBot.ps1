# Download MoonBot

try {
    while ($true) {
        
        Write-Host "Type " -NoNewline
        Write-Host "1 " -ForegroundColor Green -NoNewline
        Write-Host "or " -NoNewline
        Write-Host "2 " -ForegroundColor Red -NoNewline
        Write-Host "to download " -NoNewline
        Write-Host "Release (1) " -ForegroundColor Green -NoNewline
        Write-Host "or " -NoNewline
        Write-Host "Testing (2): " -ForegroundColor Red -NoNewline

        $MbVersion = Read-Host

        switch ($MbVersion) {

            1 {
                $MbVersion = "MoonBot"
                $MbFolder = "$env:SystemDrive\MoonBot\$MbVersion-release"
            }
            2 {
                Write-Host "Type version name without quotes" -NoNewline
                Write-Host " (case-sensitive), " -ForegroundColor Red -NoNewline
                Write-Host "e.g. S11: " -NoNewline
                $MbVersion = "MoonBot-" + (Read-Host)
                $MbFolder = "$env:SystemDrive\MoonBot\$MbVersion"
            }
        }
        
        $MbLink = "https://api.moon-bot.com/files/$MbVersion.zip"
        $MbFilename = [System.IO.Path]::GetFileName($MbLink)
        $MbPackage = "$PSScriptRoot\$MbFilename"
        
        Write-Host "Downloading $MbFilename" -ForegroundColor Cyan
        (New-Object System.Net.WebClient).DownloadFile($MbLink, $MbPackage)
        Write-Host "Extracting $MbFilename" -ForegroundColor Cyan
        
        if (Test-Path $MbFolder -PathType Leaf) {
            Remove-Item -Path $MbFolder\* -Force | Out-Null
        }
        
        [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
        [System.IO.Compression.ZipFile]::ExtractToDirectory($MbPackage, $MbFolder)
        Remove-Item -Path $MbPackage

        if (-not (Test-path "$env:Public\Desktop\MoonBot.lnk" -PathType Leaf)) {
            $MbShortcut = (New-Object -ComObject WScript.Shell).CreateShortcut("$env:Public\Desktop\MoonBot.lnk")
            $MbShortcut.TargetPath = "$env:SystemDrive\MoonBot"
            $MbShortcut.Save()
        }

        Write-Host "Extracted to $MbFolder" -ForegroundColor Cyan -NoNewline
        break
    }
}
finally {
    Write-Host "`nExiting" -ForegroundColor Cyan
}
