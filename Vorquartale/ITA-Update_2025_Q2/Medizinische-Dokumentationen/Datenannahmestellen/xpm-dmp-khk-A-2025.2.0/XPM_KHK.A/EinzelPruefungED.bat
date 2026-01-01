@echo off

echo Starte das Pruefmodul...

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.khk.start.StartKonsoleAsatz -c Konfig/konfigED.xml -f Daten/278012389_0032_20250401_a.EEKHK
)
Pause
