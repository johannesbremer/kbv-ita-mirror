@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    %XPM_JAVA_CALL% de.kbv.xpm.modul.hks.start.StartGUI -c Konfig/konfigD.xml -f Daten/123456799_11_20250701.HKSDEV

)
