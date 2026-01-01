@echo off

SET J2D_D3D=false
REM Umgebungsvariablen setzen
call SetVariablen.bat
java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
	REM Pruefmodul starten
	%XPM_JAVA_CALL% de.kbv.xpm.modul.ldk.start.StartNewGUI -c Konfig/konfig.xml -f Daten/Z01Auftrag.ldt
)

