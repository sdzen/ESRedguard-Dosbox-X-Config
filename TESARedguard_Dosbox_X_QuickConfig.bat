:: Based on Script by Solitaan (2023-05-01). Original posters: OCD_Monkey, krashd, felekks: 
https://www.speedrun.com/the_elder_scrolls_adventures_redguard/resources/xn6un
https://www.gog.com/forum/elder_scrolls_series/how_to_fix_redguard?pp=b3f0c7f6bb763af1be91d9e74eabfeb199dc1f1f
:: Execute from inside the top-level "Redguard" folder of your GOG installation 


powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/sdzen/ESRedguard-Dosbox-X-Config/releases/download/release/Dosbox_X_ESR.zip', 'DOSBox-X-ESR.zip')"
powershell -Command Expand-Archive -Force DOSBox-X-ESR.zip Dosbox-X-ESR

xcopy /s DOSBOX\* File_Backup.bak\DOSBOX\*
move dosbox_redguard.conf File_Backup.bak\dosbox_redguard.conf
xcopy /s Redguard\SYSTEM.INI File_Backup.bak\Redguard\SYSTEM.INI*

xcopy /s Dosbox_X_ESR\DOSBOX\* DOSBOX /Y

xcopy /s Dosbox_X_ESR\glide2x.dll Redguard\glide2x.dll* /Y

goto commonexit


:commonexit
echo --------TESA: Redguard installation has been updated--------
timeout /t 5

