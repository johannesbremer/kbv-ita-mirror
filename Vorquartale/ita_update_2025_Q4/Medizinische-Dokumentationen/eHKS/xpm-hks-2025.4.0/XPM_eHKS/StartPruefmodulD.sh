#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" == $RC ]; then

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartGUI -c Konfig/konfigD.xml -f Daten/123456799_11_20251001.HKSDEV

else
	echo " "
fi

