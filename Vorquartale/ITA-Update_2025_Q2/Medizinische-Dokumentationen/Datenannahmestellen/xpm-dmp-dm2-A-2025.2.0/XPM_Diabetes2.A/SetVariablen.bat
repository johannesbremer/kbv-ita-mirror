@echo off

if "%1"=="" (
	if "%~d0"=="" (
		REM Die Variable %~d0 ist bei alten Betriebssystemen wie Windows 98 unbekannt
		set XPM_INSTALLATION_DIR=./
	) else (
		set XPM_INSTALLATION_DIR=%~d0%~p0
	)
) else (
	set XPM_INSTALLATION_DIR=%1
)

set XPM_JAVA_VERSION_CHECK_CP=Bin/xpmJavaVersionCheck-1.0.2.jar
set XPM_DATEN_DIR=%XPM_INSTALLATION_DIR%/Daten/
set XPM_PROTOKOLL_DIR=%XPM_INSTALLATION_DIR%/Listen/
set XPM_CLASS_PATH=%XPM_INSTALLATION_DIR%/Bin/jasperreports-fonts-6.12.2.jar;%XPM_INSTALLATION_DIR%/Bin/xpm-core-4.2.28.jar;%XPM_INSTALLATION_DIR%/Bin/xpm-dmp-dm2-2025.2.0.jar

PATH %PATH%;%JAVA_HOME%\bin\
set XPM_JAVA_CALL=java -Xmx300m -Dfile.encoding=8859_15 -DXPM_INSTALLATION_DIR=%XPM_INSTALLATION_DIR% -DXPM_DATEN_DIR=%XPM_DATEN_DIR% -DXPM_PROTOKOLL_DIR=%XPM_PROTOKOLL_DIR% -cp "%XPM_CLASS_PATH%"




