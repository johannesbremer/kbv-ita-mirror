@echo off

echo Starte das Pruefmodul...

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP% -s
if "%ERRORLEVEL%" EQU "0" (
	REM Pruefmodul starten
	java -Xmx500m -Dfile.encoding=Cp850 -DXPM_QUARTAL_VERSION=%XPM_QUARTAL_VERSION% -classpath "%XPM_CLASS_PATH%" de.kbv.xpm.modul.kvdt.praxis.start.StartKonsole -c Konfig/konfigAusgaben.xml -f Daten/%PRUEF_DATEI%
)
Pause
