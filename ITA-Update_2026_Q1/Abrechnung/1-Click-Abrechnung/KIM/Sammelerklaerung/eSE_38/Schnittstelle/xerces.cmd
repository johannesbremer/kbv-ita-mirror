REM beispielhafte Validierung mit dem Xerces 2.12.2 Parser
REM Parameter %1 muss die zu prüfende XML-Datei sein

set dir=C:\java\xerces-2_12_2

set ENV=-cp .;%dir%\xercesImpl.jar;%dir%\xercesSamples.jar;%dir%\xml-apis.jar;%dir%\resolver.jar;

java %ENV% dom.Counter -n -s -f -v %1

echo off
REM usage: java dom.Counter (options) uri ...
REM 
REM options:
REM   -p name     Select parser by name.
REM   -x number   Select number of repetitions.
REM   -n  | -N    Turn on/off namespace processing.
REM   -v  | -V    Turn on/off validation.
REM   -s  | -S    Turn on/off Schema validation support.
REM               NOTE: Not supported by all parsers.
REM   -f  | -F    Turn on/off Schema full checking.
REM               NOTE: Requires use of -s and not supported by all parsers.
REM   -h          This help screen.
REM 
REM defaults:
REM   Parser:     dom.wrappers.Xerces
REM   Repetition: 1
REM   Namespaces: on
REM   Validation: off
REM   Schema:     off
REM   Schema full checking:     off