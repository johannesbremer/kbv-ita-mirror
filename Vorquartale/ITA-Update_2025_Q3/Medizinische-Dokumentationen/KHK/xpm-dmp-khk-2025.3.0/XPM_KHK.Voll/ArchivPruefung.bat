@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul...

    echo Pruefe Erstdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.khk.start.StartKonsole -c Konfig\konfigED.xml -z Daten\278012389_20250713181818_1_KHK_416.zip

    echo Pruefe Verlaufsdokumentation

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.khk.start.StartKonsoleVerlaufsDoku -c Konfig\konfigVD.xml -z Daten\278012389_20250713181818_1_KHK_416.zip

    Pause

)
