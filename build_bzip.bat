call settings.bat

call fetch.bat http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz bzip2-1.0.6
cd bzip2-1.0.6
if "%compiler%" == "MINGW" (
   mingw32-make
   %ER%
) else (
if  "%Variant%" == "Debug"  (
   "%SED%" -i makefile.msc -e "s@-MD @ -MDd @"
)
   nmake /f makefile.msc
   %ER%
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
