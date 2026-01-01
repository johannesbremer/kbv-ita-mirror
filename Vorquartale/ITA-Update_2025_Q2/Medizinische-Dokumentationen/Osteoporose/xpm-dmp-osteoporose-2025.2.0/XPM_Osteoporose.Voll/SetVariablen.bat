@echo off

set XPM_JAVA_VERSION_CHECK_CP=Bin/xpmJavaVersionCheck-1.0.2.jar
PATH %PATH%;%JAVA_HOME%\bin\
set XPM_JAVA_CALL=java -Xmx300m -Dfile.encoding=8859_15 -cp "Bin/jasperreports-fonts-6.12.2.jar;Bin/xpm-core-4.2.28.jar;Bin/xpm-dmp-osteoporose-2025.2.0.jar"
