@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat
java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.bkr.start.StartGUIaSatzVerlaufsDoku -c Konfig/konfigFD.xml -f Daten/278012389_1234567_20251002_4a.FBK
)
