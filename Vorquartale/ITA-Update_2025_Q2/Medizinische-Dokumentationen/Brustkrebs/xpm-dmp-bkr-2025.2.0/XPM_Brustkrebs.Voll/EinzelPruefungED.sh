#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" == $RC ]; then

    echo Starte das Pruefmodul...

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.bkr.start.StartKonsole -c Konfig/konfigED.xml -f Daten/278012389_1234567_20250412.EBK

else
	echo " "
fi

