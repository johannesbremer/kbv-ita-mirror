@echo off

echo Starte das Pruefmodul...

echo Pruefe Erstdokumentation

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.his.start.StartKonsoleAsatz -c Konfig/konfigED.xml -z Daten/278012389_20260102181818_HI_103.zip

	echo Pruefe Folgedokumentation

	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.his.start.StartKonsoleAsatzVerlaufsDoku -c Konfig/konfigVD.xml -z Daten/278012389_20260102181818_HI_103.zip
)
Pause
