
@echo off

echo Starte Generierung asymmetrischer Schluessel...

java -Dfile.encoding=8859_1 -Dlog4j.configurationFile=Bin\log4j2.xml -classpath "Bin\jasperreports-fonts-6.12.2.jar;Bin\bcprov-jdk15on-1.68.jar;Bin\xkm-1.42.7.jar" de.kbv.xkm.utils.ErzeugeSchluesselPaar Schluessel\

