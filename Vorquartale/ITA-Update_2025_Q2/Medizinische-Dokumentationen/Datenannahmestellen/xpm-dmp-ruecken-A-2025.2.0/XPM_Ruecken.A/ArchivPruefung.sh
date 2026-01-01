#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
echo Pruefe Erstdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.ruecken.start.StartKonsoleAsatz -c ${XPM_INSTALLATION_DIR}/Konfig/konfigED.xml -z ${XPM_INSTALLATION_DIR}/Daten/278012389_20250429181000_1_CR_101.zip

echo Pruefe Verlaufsdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.ruecken.start.StartKonsoleAsatzVerlaufsDoku -c ${XPM_INSTALLATION_DIR}/Konfig/konfigVD.xml -z ${XPM_INSTALLATION_DIR}/Daten/278012389_20250429181000_1_CR_101.zip
else
	echo " "
fi
