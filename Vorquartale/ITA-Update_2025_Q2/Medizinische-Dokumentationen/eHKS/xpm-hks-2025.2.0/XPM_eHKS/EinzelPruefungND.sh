#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = "${RC}" ]; then

    echo Starte das Pruefmodul...

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartKonsole_ND -c Konfig/konfigND.xml -f Daten/012568799_10_20250401.HKSND

else
	echo " "
fi

