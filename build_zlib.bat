call settings.bat

call fetch.bat http://zlib.net/zlib-1.2.8.tar.gz zlib-1.2.8

cd zlib-1.2.8

if "%compiler%" == "MINGW" (
  mingw32-make -f win32/Makefile.gcc
  %ER%
) else (
  if  "%Variant%" == "Debug"  (
    "%SED%" -i win32/Makefile.msc -e "s@-MD @ -MDd @"
  )
  nmake /f win32/Makefile.msc AS=ml64 
  %ER%
)

copy /y zlib.lib %PREFIX%\lib\
copy /y libz.a %PREFIX%\lib\
copy /y zlib.h %PREFIX%\include
copy /y zconf.h %PREFIX%\include
cd ..
