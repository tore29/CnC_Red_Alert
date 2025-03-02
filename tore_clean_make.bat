SETLOCAL
ROOT=%cd%
PATH=%windir%;%windir%\System32
ENDLOCAL

REM Compilers and utilities
SETLOCAL 
WATCOM=C:\WATCOM
TASM=C:\kode\utils\tasm
UTILS=C:\kode\utils
ENDLOCAL

REM Define Westwood libraries
SETLOCAL 
WIN32LIB=%ROOT%\WIN32LIB
ENDLOCAL

REM 3rd party libraries
SETLOCAL 
PATH=%WATCOM%\BINNT;%WATCOM%\BIN;%WATCOM%\BINW;%WATCOM%\H;%WATCOM%\H\NT;%PATH%
PATH=%TASM%\BIN;%PATH%
PATH=%UTILS%;%PATH%
ENDLOCAL

REM Delete everything (remove if you don't want to rebuild everything all the time)
rmdir /S /Q CODE\OBJ
rmdir /S /Q WINVQ\VQM32\O
rmdir /S /Q WINVQ\VQA32\O
rmdir /S /Q WIN32LIB\LIB
del ipx\wwipx32.lib

REM create directories
md WINVQ\VQM32\O
md WINVQ\VQA32\O
md WIN32LIB\LIB

md CODE\OBJ
md CODE\OBJ\WIN32\ENGLISH
md CODE\OBJ\WIN32\FRENCH
md CODE\OBJ\WIN32\GERMAN
md RUN

md WINVQ\VQM32\O
md WINVQ\VQA32\O
md WIN32LIB\LIB

echo Compiling VQA

cd winvq

cd vqm32

WMAKE PRJ=%ROOT%\WINVQ

cd ..

cd vqa32

WMAKE PRJ=%ROOT%\WINVQ

cd ..
cd ..

echo Compiling WWLIB

cd win32lib

WMAKE

cd ..

echo Compiling wwipx32

cd ipx

WMAKE

cd ..

echo Compiling Game

cd code

WMAKE WIN32=1

cd ..