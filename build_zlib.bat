setlocal
call settings.bat

call fetch.bat http://zlib.net/zlib-1.2.11.tar.gz zlib-1.2.11

cd zlib-1.2.11

if "%COMPILER%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PATH%"
  SET DESTDIR=%PREFIX:\=/%/
  SET INCLUDE_PATH=include
  SET LIBRARY_PATH=lib
  bash -c "make -f win32/Makefile.gcc install"
  bash -c "make -f win32/Makefile.gcc install SHARED_MODE=1"
  %ER%
  copy /y %PREFIX%\zlib1.dll %PREFIX%\bin
) else (
  if  "%Variant%" == "Debug"  (
    "%SEDC%" -i win32/Makefile.msc -e "s@-MD @ -MDd @"
  )
  nmake /f win32/Makefile.msc AS=ml64 
  %ER%
copy /y zlib.lib %PREFIX%\lib\
copy /y libz.a %PREFIX%\lib\
copy /y zlib.h %PREFIX%\include
copy /y zconf.h %PREFIX%\include

)

cd ..
