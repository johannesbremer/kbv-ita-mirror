@echo off

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
	REM Pruefmodul starten
	java -Xmx500m -Dfile.encoding=8859_15 -DXPM_QUARTAL_VERSION=%XPM_QUARTAL_VERSION% -classpath "%XPM_CLASS_PATH%" de.kbv.xpm.modul.kvdt.praxis.start.StartGUI -c Konfig/konfig.xml -f Daten/%PRUEF_DATEI%
)
