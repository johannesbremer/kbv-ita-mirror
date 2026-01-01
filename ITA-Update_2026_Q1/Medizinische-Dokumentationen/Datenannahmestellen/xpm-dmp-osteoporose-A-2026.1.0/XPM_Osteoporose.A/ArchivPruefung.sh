#!/bin/bash
echo Starte das Pruefmodul...
# Umgebungsvariablen setzen
. ./SetVariablen.sh
java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?

if [ "0" = $RC ]; then
	echo Pruefe Erstdokumentation
	${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.osteoporose.start.StartKonsoleAsatz -c Konfig/konfigED.xml -z Daten/278012389_20260120481818_1_OST_101.zip
	echo Pruefe Verlaufsdokumentation
	${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.osteoporose.start.StartKonsoleAsatzVerlaufsDoku -c Konfig/konfigVD.xml -z Daten/278012389_20260120481818_1_OST_101.zip
else
	echo " "
fi
