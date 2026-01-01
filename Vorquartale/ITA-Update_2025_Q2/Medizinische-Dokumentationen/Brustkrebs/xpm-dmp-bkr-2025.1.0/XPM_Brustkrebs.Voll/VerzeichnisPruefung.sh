#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" == $RC ]; then

    echo Starte das Pruefmodul im Servermodus...

    echo Pruefe Erstdokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.bkr.start.StartKonsole -s -e -m -c Konfig/konfigED.xml

    echo Pruefe Folgedokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.bkr.start.StartKonsoleVerlaufsDoku -s -e -m -c Konfig/konfigFD.xml

else
	echo " "
fi

