#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" == $RC ]; then

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm1.start.StartGUI -c Konfig/konfigED.xml -f Daten/278012389_123456_20260112.EED1

else
	echo " "
fi

