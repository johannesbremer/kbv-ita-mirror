
echo off

REM Erstellen einer PDF/A-Datei mit FOP 2.7
REM java org.apache.xalan.xslt.Process -v  -IN Sammelerklaerung%1.xml -XSL kvnoSammelFO.xsl -OUT __out.fo
REM java org.apache.fop.cli.Main -fo __out.fo -pdf Sammelerklaerung.pdf
REM java org.apache.fop.cli.Main -c fop.xconf  -fo __out.fo   -pdfa1b Sammelerklaerung.pdf


REM Erstellen einer PDF/A-Datei mit FOP 2.7

set dir=c:\java\fop-2.7

set ENV=-cp .;;%dir%\build\fop.jar;%dir%\lib\batik-all-1.14.jar;%dir%\lib\commons-io-1.3.1.jar;%dir%\lib\commons-logging-1.0.4.jar;%dir%\lib\fontbox-2.0.24.jar;%dir%\lib\serializer-2.7.2.jar;%dir%\lib\xalan-2.7.2.jar;%dir%\lib\xercesImpl-2.12.0.jar;%dir%\lib\xml-apis-1.4.01.jar;%dir%\lib\xml-apis-ext-1.3.04.jar;%dir%\lib\xmlgraphics-commons-2.7.jar;


REM ********  erster Durchlauf mit .fo Zwischendatei ************
java %ENV% org.apache.fop.cli.Main -xml ./XML-Beispiele/ese_1.21_274412300_tf+2015q3_du+Arzt.xml -xsl ./Stylesheet/kvnoSammelFOfuerPDFA-1b.xsl -a -l german -c fop.xconf -pdfprofile PDF/A-1b  -foout ./Sammelerklaerung_in_PDFA/ese_1.21_274412300_tf+2015q3_du+Arzt.foo

java %ENV% org.apache.fop.cli.Main -fo Sammelerklaerung_in_PDFA/ese_1.21_274412300_tf+2015q3_du+Arzt.foo -a -l german -c fop.xconf -pdfprofile PDF/A-1b  -pdf ./Sammelerklaerung_in_PDFA/ese_1.21_274412300_tf+2015q3_du+Arzt.pdf

java %ENV% org.apache.fop.cli.Main -xml ./XML-Beispiele/ese_1.21_274412400_tf+2015q3_du+Arzt.xml -xsl ./Stylesheet/kvnoSammelFOfuerPDFA-1b.xsl -a -l german -c fop.xconf -pdfprofile PDF/A-1b  -foout ./Sammelerklaerung_in_PDFA/ese_1.21_274412400_tf+2015q3_du+Arzt.foo

java %ENV% org.apache.fop.cli.Main -fo Sammelerklaerung_in_PDFA/ese_1.21_274412400_tf+2015q3_du+Arzt.foo -a -l german -c fop.xconf -pdfprofile PDF/A-1b  -pdf ./Sammelerklaerung_in_PDFA/ese_1.21_274412400_tf+2015q3_du+Arzt.pdf
