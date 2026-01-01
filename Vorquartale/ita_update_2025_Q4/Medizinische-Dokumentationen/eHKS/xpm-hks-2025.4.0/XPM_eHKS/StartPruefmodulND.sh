#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartGUI_ND -c Konfig/konfigND.xml -f Daten/012568799_14_20251001.HKSNDEV

else
	echo " "
fi

