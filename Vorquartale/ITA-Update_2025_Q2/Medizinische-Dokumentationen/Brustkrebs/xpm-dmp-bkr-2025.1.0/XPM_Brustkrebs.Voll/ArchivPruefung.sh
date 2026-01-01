#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" == $RC ]; then

    echo Starte das Pruefmodul...

    echo Pruefe Erstdokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.bkr.start.StartKonsole -c Konfig/konfigED.xml -z Daten/278012389_20250115181818_1_BK_425.zip

    echo Pruefe Folgedokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.bkr.start.StartKonsoleVerlaufsDoku -c Konfig/konfigFD.xml -z Daten/278012389_20250115181818_1_BK_425.zip

else
	echo " "
fi

