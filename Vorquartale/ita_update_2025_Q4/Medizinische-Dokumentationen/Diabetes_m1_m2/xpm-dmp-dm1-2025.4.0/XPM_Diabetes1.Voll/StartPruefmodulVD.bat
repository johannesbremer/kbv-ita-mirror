@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    %XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.dm1.start.StartGUIVerlaufsDoku -c Konfig/konfigVD.xml -f Daten/278012389_123456_20251012.EVD1

) 
