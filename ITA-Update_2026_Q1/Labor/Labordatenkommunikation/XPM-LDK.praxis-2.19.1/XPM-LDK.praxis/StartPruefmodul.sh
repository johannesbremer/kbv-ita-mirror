#!/bin/bash
# Umgebungsvariablen setzen
. ./SetVariablen.sh $1
export DISPLAY=:0.0
java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = "${RC}" ]; then
	# Pruefmodul starten
	${XPM_JAVA_CALL} de.kbv.xpm.modul.ldk.start.StartNewGUI -c Konfig/konfig.xml -f Daten/Z01Auftrag.ldt
else
	echo " "
fi

