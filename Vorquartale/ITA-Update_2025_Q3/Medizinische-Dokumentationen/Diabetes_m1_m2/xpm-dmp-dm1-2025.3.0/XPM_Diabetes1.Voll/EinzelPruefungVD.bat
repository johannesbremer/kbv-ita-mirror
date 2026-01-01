@echo off


REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP% -s
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...
    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.dm1.start.StartKonsoleVerlaufsDoku -c Konfig\konfigVD.xml -f Daten\278012389_123456_20250712.EVD1

    Pause

)
