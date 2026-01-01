@echo off

echo Pruefe Dokumentation (Dermatologen)
REM Umgebungsvariablen setzen
call SetVariablen.bat

java -jar %XPM_JAVA_VERSION_CHECK_CP%
if "%ERRORLEVEL%" EQU "0" (

    echo Starte das Pruefmodul im Servermodus...



    %XPM_JAVA_CALL% de.kbv.xpm.modul.hks.start.StartKonsole -s -e -m -c Konfig\konfigD.xml

	echo Pruefe Dokumentation (Nicht-Dermatologen)

    %XPM_JAVA_CALL% de.kbv.xpm.modul.hks.start.StartKonsole_ND -s -e -m -c Konfig\konfigND.xml

    Pause

) 

