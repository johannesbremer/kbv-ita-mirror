#!/bin/bash

echo "Auswertung Kommandozeilenparameter"
# Auswertung Kommandozeilenparameter:
#  kein Parameter   - voreingestellte Konfigurationsdateien und Umgebungsvariablen
#                     werden verwendet.
#  zwei Parameter   - Konfigurationsdateien $1 und $2 und voreingestellte
#                     Umgebungsvariablenwerden werden verwendet.
#  vier bzw. fuenf  - Konfigurationsdateien $1 und $2 werden verwendet.
#  Parameter          Umgebungsvariablen werden folgendermassen gesetzt
#                     XPM_DATEN_DIR        = $3
#                     XPM_PROTOKOLL_DIR    = $4
#                     XPM_INSTALLATION_DIR = $5


# Umgebungsvariablen setzen
. ./SetVariablen.sh $5

FEHLER() {
	echo "FEHLER BEI DER ANZAHL DER UEBERGABEPARAMETER!"
	echo "Um diesen Batchlauf zu steuern, können folgende Uebergabeoptionen"
	echo "verwendet werden:"
	echo " kein Parameter   - voreingestellte Konfigurationsdateien und"
	echo "                    Umgebungsvariablen werden verwendet."
	echo " zwei Parameter   - Erster Uebergabeparameter = Konfigurationsdatei für die"
	echo "                    erstmalige Dokumentation."
	echo "                    Zweiter Uebergabeparameter = Konfigurationsdatei für die"
	echo "                    Verlaufsdokumentation."
	echo "                    Die voreingestellten Umgebungsvariablen werden verwendet."
	echo " vier bzw. fünf   - Erster Uebergabeparameter = Konfigurationsdatei für die"
	echo " Parameter          erstmalige Dokumentation."
	echo "                    Zweiter Uebergabeparameter = Konfigurationsdatei für die"
	echo "                    Verlaufsdokumentation."
	echo "                    Umgebungsvariablen werden folgendermassen gesetzt"
	echo "                    XPM_DATEN_DIR        = Dritter Uebergabeparameter"
	echo "                    XPM_PROTOKOLL_DIR    = Vierter Uebergabeparameter"
	echo "                    XPM_INSTALLATION_DIR = Fuenfter Uebergabeparameter (optional)"
	exit
}

if [ $# -lt '4' ]
then
	if [ $# -lt '3' ]
	then
		if [ $# -lt '2' ]
		then
			if [ $# -eq '0' ]
			then
				echo "Voreinstellte Konfigurationsdateien werden verwendet, da kein Parameter uebergeben wurde."
				KONFIG_ED=${XPM_INSTALLATION_DIR}/Konfig/konfigED.xml
				KONFIG_VD=${XPM_INSTALLATION_DIR}/Konfig/konfigVD.xml
			else
				FEHLER
			fi
		else
			echo "Konfigurationsdateien $1 und $2 werden verwendet."
			KONFIG_ED=$1
			KONFIG_VD=$2
		fi
	else
		FEHLER
	fi
else
	echo "Konfigurationsdateien $1 und $2 werden verwendet."
	KONFIG_ED=$1
	KONFIG_VD=$2
	echo "Umgebungssvariablen werden gesetzt."
	XPM_DATEN_DIR=$3
	XPM_PROTOKOLL_DIR=$4
fi

echo Starte das Pruefmodul im Servermodus...

java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" = $RC ]; then
echo Pruefe Erstdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm1.start.StartKonsoleAsatz -s -e -m -c ${KONFIG_ED}

echo Pruefe Verlaufsdokumentation

${XPM_JAVA_CALL} de.kbv.xpm.modul.dmp.dm1.start.StartKonsoleAsatzVerlaufsDoku -s -e -m -c ${KONFIG_VD}
else
	echo " "
fi
