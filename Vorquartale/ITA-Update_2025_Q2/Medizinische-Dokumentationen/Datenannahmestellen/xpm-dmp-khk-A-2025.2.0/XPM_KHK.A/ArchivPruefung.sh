#!/bin/bash

echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh

java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = $RC ]; then
echo Pruefe Erstdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.khk.start.StartKonsoleAsatz -c Konfig/konfigED.xml -z Daten/2780123_20250403181818_1_KHK_416.zip

echo Pruefe Verlaufsdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.khk.start.StartKonsoleAsatzVerlaufsDoku -c Konfig/konfigVD.xml -z Daten/2780123_20250403181818_1_KHK_416.zip
else
	echo " "
fi
