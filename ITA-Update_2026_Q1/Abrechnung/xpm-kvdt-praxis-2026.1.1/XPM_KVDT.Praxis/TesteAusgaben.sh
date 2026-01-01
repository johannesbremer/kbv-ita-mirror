echo Starte das Pruefmodul...

# Umgebungsvariablen setzen
. ./SetVariablen.sh $1
unset DISPLAY
java -jar $XPM_JAVA_VERSION_CHECK_CP -s
RC=$?
if [ "0" = "${RC}" ]; then
	# Pruefmodul starten
	java -Xmx500m -Dfile.encoding=UTF8 -DXPM_QUARTAL_VERSION=${XPM_QUARTAL_VERSION} -classpath "${XPM_CLASS_PATH}" de.kbv.xpm.modul.kvdt.praxis.start.StartKonsole -c Konfig/konfigAusgaben.xml -f ${PRUEF_DATEI}
else
	echo " "
fi