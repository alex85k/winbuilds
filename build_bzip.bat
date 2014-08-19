call settings.bat

cd bzip2-1.0.6
if "%compiler%" == "MINGW" (
   mingw32-make
) else (
   nmake /f makefile.msc
)

copy /y *.lib %PREFIX%\lib\
if  "%Variant%" == "Debug"  (
  copy /y libbz2.lib %PREFIX%\lib\bzip2d.lib
  copy /y libbz2.a %PREFIX%\lib\bzip2d.a
) else (
  copy /y libbz2.lib %PREFIX%\lib\bzip2.lib
  copy /y libbz2.a %PREFIX%\lib\bzip2.a
)
copy /y bzlib.h %PREFIX%\include
cd ..


