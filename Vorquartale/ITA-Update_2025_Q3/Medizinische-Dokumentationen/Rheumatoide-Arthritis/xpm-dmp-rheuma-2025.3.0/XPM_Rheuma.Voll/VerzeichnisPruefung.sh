#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then

    echo Starte das Pruefmodul im Servermodus...

    echo Pruefe Erstdokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.rheuma.start.StartKonsole -s -e -m -c Konfig/konfigED.xml

    echo Pruefe Verlaufsdokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.rheuma.start.StartKonsoleVerlaufsDoku -s -e -m -c Konfig/konfigVD.xml

else
	echo " "
fi

