@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...

    %XPM_JAVA_CALL% de.kbv.xpm.modul.hks.start.StartKonsole -c Konfig\konfigD.xml -f Daten\123456799_12_20250701.HKSD

    Pause

) 
