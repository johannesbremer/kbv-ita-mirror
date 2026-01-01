@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat
java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.asthma.start.StartGUIaSatzVerlaufsDoku -c Konfig/konfigVD.xml -f Daten/278012389_123456_20250702_a.EVAB
)
