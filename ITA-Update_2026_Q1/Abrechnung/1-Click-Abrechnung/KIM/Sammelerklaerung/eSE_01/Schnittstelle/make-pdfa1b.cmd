
echo off

REM Erstellen einer PDF/A-1b Datei mit Apache FOP 2.7

set dir=C:\JAVA\fop-2.7\fop

set ENV=-cp .;;%dir%\build\fop.jar;%dir%\lib\batik-all-1.14.jar;%dir%\lib\commons-io-1.3.1.jar;%dir%\lib\commons-logging-1.0.4.jar;%dir%\lib\fontbox-2.0.24.jar;%dir%\lib\serializer-2.7.2.jar;%dir%\lib\xalan-2.7.2.jar;%dir%\lib\xercesImpl-2.12.0.jar;%dir%\lib\xml-apis-1.4.01.jar;%dir%\lib\xml-apis-ext-1.3.04.jar;%dir%\lib\xmlgraphics-commons-2.7.jar;

set DATEINAME=ese_1.21_019999900_tf+2025q4_nr+1

REM ********  erster Durchlauf ohne .fo Zwischendatei ************
java %ENV% org.apache.fop.cli.Main -xml ./XML-Beispiele/%DATEINAME%.xml -xsl ./Stylesheet/kvshSammelFOfuerPDFA-1b.xsl -a -l german -c fop.xconf -pdfprofile PDF/A-1b -pdf  ./Sammelerklaerung_in_PDFA/%DATEINAME%.pdf
