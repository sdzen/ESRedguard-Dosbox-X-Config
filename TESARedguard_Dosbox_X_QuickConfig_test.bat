:: Based on Script by Solitaan (2023-05-01). Original posters: OCD_Monkey, krashd, felekks: 
:: https://www.speedrun.com/the_elder_scrolls_adventures_redguard/resources/xn6un
:: https://www.gog.com/forum/elder_scrolls_series/how_to_fix_redguard?pp=b3f0c7f6bb763af1be91d9e74eabfeb199dc1f1f
:: Execute from inside the top-level "Redguard" folder of your GOG installation 


powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/sdzen/ESRedguard-Dosbox-X-Config/releases/download/release/Dosbox_X_ESR.zip', 'DOSBox-X-ESR.zip')"
powershell -Command Expand-Archive -Force DOSBox-X-ESR.zip Dosbox_X_ESR
xcopy /s DOSBOX\* File_Backup.bak\DOSBOX\*
move dosbox_redguard.conf File_Backup.bak\dosbox_redguard.conf
xcopy /s Redguard\SYSTEM.INI File_Backup.bak\Redguard\SYSTEM.INI*
xcopy /s Dosbox_X_ESR\DOSBOX\* DOSBOX /Y
xcopy /s Dosbox_X_ESR\dosbox_redguard.conf* .\ /Y
xcopy /s Dosbox_X_ESR\glide2x.dll Redguard\glide2x.dll* /Y
xcopy /s Dosbox_X_ESR\SYSTEM.INI Redguard\SYSTEM.INI* /Y

echo Select Resolution Configuration for Redguard With DgVoodoo
echo 1 - 640x480 (4:3) DOS Resolution - Best Performance
echo 2 - 1024x768 (4:3) Base Game - Good Mix
echo 3 - 1440x1080 (4:3) 1080p - Not Stretched
echo 4 - 1920x1080 (16:9) 1080p - Stretched
echo 5 - 1920x1440 (4:3) 1440p - Not Stretched
echo 6 - 2560x1440 (16:9) 1440p - Stretched
echo 7 - 2880x2160 (4:3) 4K - Not Stretched
echo 8 - 3840x2160 (16:9) 4K - Stretched

:inputChoice
set /p userChoice="Select: "
if "%userChoice%"=="1" goto DOS
if "%userChoice%"=="2" goto BASE
if "%userChoice%"=="3" goto 108043
if "%userChoice%"=="4" goto 1080169
if "%userChoice%"=="5" goto 144043
if "%userChoice%"=="6" goto 1440169
if "%userChoice%"=="7" goto 4K143
if "%userChoice%"=="8" goto 4K169

:DOS
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 640x480@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit
:BASE
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 1024x768@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit
:108043
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 1440x1080@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit
:1080169
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 1920x1080@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit
:144043
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 1920x1440@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit
:1440169
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 2560x1440@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit
:4K43
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 2880x2160@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit
:4K169
powershell -Command "(gc DOSBOX\dgVoodoo.conf) -replace 'Resolution                          = unforced', 'Resolution                          = 3840x2160@60' | Out-File -encoding ASCII DOSBOX\dgVoodoo.conf"
goto commonexit





:commonexit
echo --------TESA: Redguard installation has been updated--------
timeout /t 5

