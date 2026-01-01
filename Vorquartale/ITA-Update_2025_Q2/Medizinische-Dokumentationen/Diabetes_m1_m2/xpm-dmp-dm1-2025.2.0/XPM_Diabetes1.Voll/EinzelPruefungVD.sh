
#!/bin/bash

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" = $RC ]; then

    echo Starte das Pruefmodul...

    ${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm1.start.StartKonsoleVerlaufsDoku -c Konfig/konfigVD.xml -f Daten/278012389_123456_20250512.EVD1

else
	echo " "
fi

