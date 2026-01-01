#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.ruecken.start.StartGUIaSatz -c ${XPM_INSTALLATION_DIR}/Konfig/konfigED.xml -f ${XPM_INSTALLATION_DIR}/Daten/278012389_123_20251002_a.EECR
else
	echo " "
fi
