#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm1.start.StartGUIaSatzVerlaufsDoku -c ${XPM_INSTALLATION_DIR}/Konfig/konfigVD.xml -f ${XPM_INSTALLATION_DIR}/Daten/278012389_123456_20251012_a.EVD1
else
	echo " "
fi
