@echo off

echo Starte das Pruefmodul...

REM Umgebungsvariablen setzen
call SetVariablen.bat
java -jar %XPM_JAVA_VERSION_CHECK_CP% -s
if "%ERRORLEVEL%" EQU "0" (
%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.dm1.start.StartKonsoleAsatzVerlaufsDoku -c Konfig/konfigVD.xml -f Daten/278012389_123456_20250712_a.EVD1
)
Pause
