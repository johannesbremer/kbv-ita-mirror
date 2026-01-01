@echo off


REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...
    %XPM_JAVA_CALL% de.kbv.xpm.modul.hks.start.StartKonsole_ND -c Konfig\konfigND.xml -f Daten\012568799_10_20250401.HKSND

    Pause

) 
