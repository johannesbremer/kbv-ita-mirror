#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
  ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.bkr.start.StartGUIaSatz -c ./Konfig/konfigED.xml -f ./Daten/278012389_1234567_20251012_4a.EBK
else
	echo " "
fi
