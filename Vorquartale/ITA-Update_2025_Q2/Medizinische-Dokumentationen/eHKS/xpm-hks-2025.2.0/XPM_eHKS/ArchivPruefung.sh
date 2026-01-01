#!/bin/bash



# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = "${RC}" ]; then
echo Starte das Pruefmodul...

echo 'Pruefe Dokumentation (Dermatologen)'
    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartKonsole -c Konfig/konfigD.xml -z Daten/2780123_20250405120000_1_eHKS.zip

	echo 'Pruefe Dokumentation (Nicht-Dermatologen)'

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.hks.start.StartKonsole_ND -c Konfig/konfigND.xml -z Daten/2780123_20250405120000_1_eHKS.zip

else
	echo " "
fi


