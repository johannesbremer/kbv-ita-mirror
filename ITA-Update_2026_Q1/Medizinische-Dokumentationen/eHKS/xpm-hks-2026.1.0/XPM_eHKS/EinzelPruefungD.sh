#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = "${RC}" ]; then

    echo Starte das Pruefmodul...

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartKonsole -c Konfig/konfigD.xml -f Daten/123456799_12_20260101.HKSD

else
	echo " "
fi

