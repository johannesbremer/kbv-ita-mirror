@echo off

echo Starte die Verzeichnispruefung...
REM Umgebungsvariablen setzen
call SetVariablen.bat
java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
%XPM_JAVA_CALL% de.kbv.xpm.modul.ldk.start.StartKonsole -s -e -m -c Konfig\konfig.xml
)
Pause
