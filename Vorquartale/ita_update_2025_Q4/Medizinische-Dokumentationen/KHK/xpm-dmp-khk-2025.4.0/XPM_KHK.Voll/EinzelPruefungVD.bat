@echo off


REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...
    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.khk.start.StartKonsoleVerlaufsDoku -c Konfig\konfigVD.xml -f Daten\278012389_0032_20251012.EVKHK

    Pause

) 
