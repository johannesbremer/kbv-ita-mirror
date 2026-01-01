#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then

    echo Starte das Pruefmodul...

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.asthma.start.StartKonsole -c Konfig/konfigED.xml -f Daten/278012389_123456_20251017.EEAB

else
	echo " "
fi

