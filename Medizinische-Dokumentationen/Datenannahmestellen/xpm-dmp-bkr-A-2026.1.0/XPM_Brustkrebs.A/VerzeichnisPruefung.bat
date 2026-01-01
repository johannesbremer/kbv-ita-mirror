@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul im Servermodus...

    echo Pruefe Erstdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.bkr.start.StartKonsoleAsatz -s -e -m -c Konfig\konfigED.xml

    echo Pruefe Verlaufsdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.bkr.start.StartKonsoleAsatzVerlaufsDoku -s -e -m -c Konfig\konfigFD.xml

    Pause

) 

