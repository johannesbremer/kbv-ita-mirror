#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then

    echo Starte das Pruefmodul...

    echo Pruefe Erstdokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.ruecken.start.StartKonsole -c Konfig/konfigED.xml -z Daten/278012389_20250701181818_1_CR_101.zip

    echo Pruefe Verlaufsdokumentation

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.ruecken.start.StartKonsoleVerlaufsDoku -c Konfig/konfigVD.xml -z Daten/278012389_20250701181818_1_CR_101.zip

else
	echo " "
fi


