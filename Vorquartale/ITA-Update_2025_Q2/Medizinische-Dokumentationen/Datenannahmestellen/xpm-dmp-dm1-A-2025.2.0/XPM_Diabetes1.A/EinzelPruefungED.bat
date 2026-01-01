@echo off

echo Starte das Pruefmodul...

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP% -s
if "%ERRORLEVEL%" EQU "0" (
%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.dm1.start.StartKonsoleAsatz -c Konfig/konfigED.xml -f Daten/278012389_123456_20250412_a.EED1
)
Pause
