@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP% -s
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.depression.start.StartKonsole -c Konfig\konfigED.xml -f Daten\278012389_123_20260120.EEDE

    Pause

)
