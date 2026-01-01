#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" = $RC ]; then
echo Pruefe Erstdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm2.start.StartKonsoleAsatz -c Konfig/konfigED.xml -z Daten/278012389_20250520120000_1_DM2_607.zip

echo Pruefe Verlaufsdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm2.start.StartKonsoleAsatzVerlaufsDoku -c Konfig/konfigVD.xml -z Daten/278012389_20250520120000_1_DM2_607.zip
else
	echo " "
fi
