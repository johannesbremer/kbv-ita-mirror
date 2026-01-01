#!/bin/bash

echo 'Pruefe Dokumentation (Dermatologen)'
# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = "${RC}" ]; then

    echo Starte das Pruefmodul im Servermodus...


    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartKonsole -s -e -m -c Konfig/konfigD.xml

	echo 'Pruefe Dokumentation (Nicht-Dermatologen)'

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartKonsole_ND -s -e -m -c Konfig/konfigND.xml

else
	echo " "
fi

