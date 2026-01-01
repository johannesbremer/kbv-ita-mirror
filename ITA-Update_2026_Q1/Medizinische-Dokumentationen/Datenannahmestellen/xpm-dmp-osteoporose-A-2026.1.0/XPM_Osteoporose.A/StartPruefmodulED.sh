#!/bin/bash
# Umgebungsvariablen setzen
. ./SetVariablen.sh
java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?

if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.osteoporose.start.StartGUIaSatz -c Konfig/konfigED.xml -f Daten/278012389_123_20260120_a.EEOST
else
	echo " "
fi
