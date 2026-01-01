# Umgebungsvariablen setzen
. ./SetVariablen.sh $1

export DISPLAY=:0.0
java -jar $XPM_JAVA_VERSION_CHECK_CP
RC=$?
if [ "0" = "${RC}" ]; then
	# Pruefmodul starten
	java -Xmx500m -Dfile.encoding=8859_15 -DXPM_QUARTAL_VERSION=${XPM_QUARTAL_VERSION} -classpath "${XPM_CLASS_PATH}" de.kbv.xpm.modul.kvdt.praxis.start.StartGUI -c Konfig/konfig.xml -f ${PRUEF_DATEI}
else
	echo " "
fi