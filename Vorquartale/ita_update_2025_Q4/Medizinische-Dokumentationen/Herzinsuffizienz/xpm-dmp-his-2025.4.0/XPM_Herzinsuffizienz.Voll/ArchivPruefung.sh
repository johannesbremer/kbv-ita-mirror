#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" == $RC ]; then

    echo Starte das Pruefmodul...

    echo Pruefe Erstdokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.his.start.StartKonsole -c Konfig/konfigED.xml -z Daten/278012389_20251002181818_1_HI_103.zip

    echo Pruefe Folgedokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.his.start.StartKonsoleVerlaufsDoku -c Konfig/konfigVD.xml -z Daten/278012389_20251002181818_1_HI_103.zip

else
	echo " "
fi

