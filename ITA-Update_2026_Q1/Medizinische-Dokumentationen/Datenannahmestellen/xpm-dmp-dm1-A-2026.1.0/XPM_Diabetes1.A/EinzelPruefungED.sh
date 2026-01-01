#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" = $RC ]; then
${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm1.start.StartKonsoleAsatz -c Konfig/konfigED.xml -f Daten/278012389_123456_20260112_a.EED1
else
	echo " "
fi
