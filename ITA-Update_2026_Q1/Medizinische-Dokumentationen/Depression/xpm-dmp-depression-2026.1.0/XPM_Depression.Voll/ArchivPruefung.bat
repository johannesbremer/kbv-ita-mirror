@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP% -s
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...

    echo Pruefe Erstdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.depression.start.StartKonsole -c Konfig\konfigED.xml -z Daten\278012389_20260130181818_1_DE_102.zip

    echo Pruefe Verlaufsdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.depression.start.StartKonsoleVerlaufsDoku -c Konfig\konfigVD.xml -z Daten\278012389_20260130181818_1_DE_102.zip

    Pause

)
