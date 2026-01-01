@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...

    echo Pruefe Erstdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.hks.start.StartKonsole -c Konfig\konfigD.xml -z Daten\2780123_20260105120000_1_eHKS.zip
    echo Pruefe Verlaufsdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.hks.start.StartKonsole_ND -c Konfig\konfigND.xml -z Daten\2780123_20260105120000_1_eHKS.zip

    Pause

)
