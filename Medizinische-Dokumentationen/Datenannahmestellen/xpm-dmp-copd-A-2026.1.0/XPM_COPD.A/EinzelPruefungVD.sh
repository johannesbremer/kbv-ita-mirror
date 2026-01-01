#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.copd.start.StartKonsoleAsatzVerlaufsDoku -c ./Konfig/konfigVD.xml -f ./Daten/278012389_123456_20260102_A.EVCO
else
	echo " "
fi
