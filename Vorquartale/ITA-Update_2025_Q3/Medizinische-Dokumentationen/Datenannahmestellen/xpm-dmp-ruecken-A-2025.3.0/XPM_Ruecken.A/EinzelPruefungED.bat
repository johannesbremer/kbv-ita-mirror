@echo off

echo Starte das Pruefmodul...

REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
%XPM_JAVA_CALL% de.kbv.xpm.modul.dmp.ruecken.start.StartKonsoleAsatz -c %XPM_INSTALLATION_DIR%/Konfig/konfigED.xml -f %XPM_INSTALLATION_DIR%/Daten/278012389_123_20250702_a.EECR
)
Pause
