#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.bkr.start.StartKonsoleAsatzVerlaufsDoku -c ./Konfig/konfigFD.xml -f ./Daten/278012389_1234567_20260102_4a.FBK
else
	echo " "
fi
