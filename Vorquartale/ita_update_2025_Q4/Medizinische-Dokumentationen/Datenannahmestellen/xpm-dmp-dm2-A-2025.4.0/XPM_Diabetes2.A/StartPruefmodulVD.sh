#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm2.start.StartGUIaSatzVerlaufsDoku -c Konfig/konfigVD.xml -f Daten/278012389_123456_20251012_a.EVD2
else
	echo " "
fi
