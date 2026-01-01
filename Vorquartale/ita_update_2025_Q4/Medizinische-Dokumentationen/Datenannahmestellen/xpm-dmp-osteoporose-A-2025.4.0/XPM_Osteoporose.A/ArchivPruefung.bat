@echo off

echo Starte das Pruefmodul...

echo Pruefe Erstdokumentation

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.osteoporose.start.StartKonsoleAsatz -c %XPM_INSTALLATION_DIR%/Konfig/konfigED.xml -z %XPM_INSTALLATION_DIR%/Daten/278012389_20251020481818_1_OST_101.zip

	echo Pruefe Verlaufsdokumentation

	%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.osteoporose.start.StartKonsoleAsatzVerlaufsDoku -c %XPM_INSTALLATION_DIR%/Konfig/konfigVD.xml -z %XPM_INSTALLATION_DIR%/Daten/278012389_20251020481818_1_OST_101.zip
)
Pause
