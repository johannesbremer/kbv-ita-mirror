@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.dm2.start.StartGUI -c Konfig/konfigED.xml -f Daten/278012389_123456_20260112.EED2

)
