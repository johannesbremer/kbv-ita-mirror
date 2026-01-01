
@echo off

echo Starte XKM-GUI

java -Xmx300m -Dfile.encoding=8859_1 -Dlog4j.configurationFile=Bin\log4j2.xml -classpath "Bin\jasperreports-fonts-6.12.2.jar;Bin\bcprov-jdk18on-1.80.jar;Bin\xkm-1.42.9.jar" de.kbv.xkm.gui.XKMGUI %1 %2 %3 %4 %5 %6 %7 %8 %9

