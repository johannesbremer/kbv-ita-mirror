#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
echo Pruefe Erstdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.depression.start.StartKonsoleAsatz -c ${XPM_INSTALLATION_DIR}/Konfig/konfigED.xml -z ${XPM_INSTALLATION_DIR}/Daten/278012389_20250720181818_1_DE_102.zip

echo Pruefe Verlaufsdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.depression.start.StartKonsoleAsatzVerlaufsDoku -c ${XPM_INSTALLATION_DIR}/Konfig/konfigVD.xml -z ${XPM_INSTALLATION_DIR}/Daten/278012389_20250720181818_1_DE_102.zip
else
	echo " "
fi
