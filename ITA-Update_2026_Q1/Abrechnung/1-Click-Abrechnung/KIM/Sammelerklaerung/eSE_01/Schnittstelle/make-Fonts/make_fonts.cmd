set fopdir=C:\JAVA\fop-2.7\fop

set ENV=-cp %fopdir%\build\fop.jar;%fopdir%\lib\commons-logging-1.0.4.jar;%fopdir%\lib\commons-io-1.3.1.jar;%fopdir%\lib\xmlgraphics-commons-2.7.jar;%fopdir%\lib\xercesImpl-2.12.0.jar;%fopdir%\lib\xml-apis-1.3.04.jar

java %ENV% org.apache.fop.fonts.apps.TTFReader -enc ansi c:\windows\Fonts\arial.ttf   	arial.ttf.xml

java %ENV% org.apache.fop.fonts.apps.TTFReader -enc ansi c:\windows\Fonts\arialbd.ttf   arialbd.ttf.xml

java %ENV% org.apache.fop.fonts.apps.TTFReader -enc ansi c:\windows\Fonts\arialbi.ttf   arialbi.ttf.xml

java %ENV% org.apache.fop.fonts.apps.TTFReader -enc ansi c:\windows\Fonts\ariali.ttf   	ariali.ttf.xml

java %ENV% org.apache.fop.fonts.apps.TTFReader -enc ansi c:\windows\Fonts\code39u.ttf   code39u.ttf.xml

echo off
