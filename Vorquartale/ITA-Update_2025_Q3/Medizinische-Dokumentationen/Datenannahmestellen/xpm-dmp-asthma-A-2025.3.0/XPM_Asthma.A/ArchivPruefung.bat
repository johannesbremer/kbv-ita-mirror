@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...

    echo Pruefe Erstdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.asthma.start.StartKonsoleAsatz -c Konfig\konfigED.xml -z Daten\278012389_20250705181818_1_AB_446.zip

    echo Pruefe Verlaufsdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.asthma.start.StartKonsoleAsatzVerlaufsDoku -c Konfig\konfigVD.xml -z Daten\278012389_20250705181818_1_AB_446.zip
    Pause

)

