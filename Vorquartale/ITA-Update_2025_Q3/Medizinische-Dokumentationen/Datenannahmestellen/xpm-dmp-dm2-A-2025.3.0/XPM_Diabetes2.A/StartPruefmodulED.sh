#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm2.start.StartGUIaSatz -c Konfig/konfigED.xml -f Daten/278012389_123456_20250712_a.EED2
else
	echo " "
fi
