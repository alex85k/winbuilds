setlocal
call settings.bat

call fetch.bat http://xmlsoft.org/sources/libxml2-2.9.3.tar.gz libxml2-2.9.3

if "%compiler%" == "MINGW" (
  SET FLAGS="compiler=mingw"  
) else (
  SET FLAGS="iconv=no" 
)

cd libxml2-2.9.3
copy configure.ac configure.in

if "%compiler%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PATH%"
  if NOT EXIST Makefile (bash -c "./configure %CONFARGS% --without-python")
  %ER%
  bash -c "make install -j2"
  %ER%
) else (
  cd win32
  if  "%Variant%" == "Debug"  (
    rem "%SEDC%" -i makefile.Msvc -e "s@/Z7$@/Z7 /MDd@"
     cscript.exe configure.js debug=yes %FLAGS% prefix=%PREFIX%  cruntime=/MDd
  ) else (
     cscript.exe configure.js %FLAGS% prefix=%PREFIX%
)

  nmake install
  rem nmake checktests
)
del %PREFIX%\bin\test*.exe
del %PREFIX%\bin\test*.pdb

mkdir %PREFIX%\include\libxml
xcopy /d /y /e %PREFIX%\include\libxml2\libxml %PREFIX%\include\libxml

cd ..\..

