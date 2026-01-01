#!/bin/bash
# Umgebungsvariablen setzen
. ./SetVariablen.sh $1
echo Starte die Verzeichnispruefung...

unset DISPLAY
java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" = "${RC}" ]; then
  ${XPM_JAVA_CALL} de.kbv.xpm.modul.ldk.start.StartKonsole -x -s -e -m -c Konfig/konfig.xml
else
	echo " "
fi
