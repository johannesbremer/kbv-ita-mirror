#!/bin/bash


# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then

    echo Starte das Pruefmodul...

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.asthma.start.StartKonsoleAsatzVerlaufsDoku -c Konfig/konfigVD.xml -f Daten/278012389_123456_20250702_a.EVAB
else
	echo " "
fi
