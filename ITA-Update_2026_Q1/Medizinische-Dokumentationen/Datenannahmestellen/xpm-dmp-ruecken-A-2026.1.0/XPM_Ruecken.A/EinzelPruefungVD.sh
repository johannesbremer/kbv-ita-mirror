#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.ruecken.start.StartKonsoleAsatzVerlaufsDoku -c ${XPM_INSTALLATION_DIR}/Konfig/konfigVD.xml -f ${XPM_INSTALLATION_DIR}/Daten/278012389_123_20260105_a.EVCR
else
	echo " "
fi
