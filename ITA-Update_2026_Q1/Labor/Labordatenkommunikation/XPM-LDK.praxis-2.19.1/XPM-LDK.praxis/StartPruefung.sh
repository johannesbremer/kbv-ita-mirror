#!/bin/bash
# Umgebungsvariablen setzen
. ./SetVariablen.sh $1
echo Starte das Pruefmodul...
unset DISPLAY
java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" = "${RC}" ]; then
	${XPM_JAVA_CALL} de.kbv.xpm.modul.ldk.start.StartKonsole -c Konfig/konfig.xml -f Daten/Z01Auftrag.ldt
else
	echo " "
fi
