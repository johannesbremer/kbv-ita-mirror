#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then

    echo Starte das Pruefmodul...

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.rheuma.start.StartKonsoleVerlaufsDoku -c Konfig/konfigVD.xml -f Daten/278012389_123_20260120.EVRA

else
	echo " "
fi

