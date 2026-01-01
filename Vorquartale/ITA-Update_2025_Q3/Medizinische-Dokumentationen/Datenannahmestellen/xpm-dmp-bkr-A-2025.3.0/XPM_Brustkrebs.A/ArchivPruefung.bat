@echo off

echo Starte das Pruefmodul...

echo Pruefe Erstdokumentation

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.bkr.start.StartKonsoleAsatz -c Konfig/konfigED.xml -z Daten/278012389_20250702181818_1_BK_425.zip

	echo Pruefe Folgedokumentation

	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.bkr.start.StartKonsoleAsatzVerlaufsDoku -c Konfig/konfigFD.xml -z Daten/278012389_20250702181818_1_BK_425.zip
)
Pause
