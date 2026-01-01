
@echo off

echo Starte Generierung asymmetrischer Schluessel...

java -Dfile.encoding=8859_1 -Dlog4j.configurationFile=Bin\log4j2.xml -classpath "Bin\jasperreports-fonts-6.12.2.jar;Bin\bcprov-jdk18on-1.81.jar;Bin\xkm-1.43.0.jar" de.kbv.xkm.utils.ErzeugeSchluesselPaar Schluessel\

