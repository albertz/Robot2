@echo off
IF "%1"=="" GOTO ENDE
IF "%2"=="" GOTO ENDE
COPY ENTP.EXE %1:%2ENTP.EXE
%1:
CD\
CD %2
IF "%3"=="Ja" GOTO L 
GOTO W
:L
rem ECHO.
rem ECHO Dateien werden gelöscht...
rem ECHO.
ATTRIB -R *.*
ATTRIB +R ENTP.EXE
DEL *.*
ATTRIB -R ENTP.EXE
:W
ENTP
DEL ENTP.EXE
REM ATTRIB +R *.*
ECHO.
ECHO Installation abgeschlossen!
:ENDE