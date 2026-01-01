@echo off

echo Starte das Pruefmodul...
REM Umgebungsvariablen setzen
call SetVariablen.bat
java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (
%XPM_JAVA_CALL% de.kbv.xpm.modul.ldk.start.StartKonsole -c Konfig\konfig.xml -f Daten\Muster_10A_D^(10_2020^).pdf -i
)
Pause
