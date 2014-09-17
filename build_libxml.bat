call fetch.bat ftp://xmlsoft.org/libxml2/libxml2-2.9.1.tar.gz libxml2-2.9.1

call settings.bat

if "%compiler%" == "MINGW" (
  SET FLAGS="compiler=mingw"  
) else (
  SET FLAGS="iconv=no" 
)


cd libxml2-2.9.1/win32
if  "%Variant%" == "Debug"  (
  "%SED%" -i makefile.Msvc -e "s@/Z7$@/Z7 /MDd@"
   cscript.exe configure.js debug=yes %FLAGS% prefix=%PREFIX%
) else (
   cscript.exe configure.js %FLAGS% prefix=%PREFIX%
)
if "%compiler%" == "MINGW" (
  mingw32-make install
) else (
  nmake install
)
del %PREFIX%\bin\test*.exe
del %PREFIX%\bin\test*.pdb

mkdir %PREFIX%\include\libxml
xcopy /d /y /e %PREFIX%\include\libxml2\libxml %PREFIX%\include\libxml

cd ..\..

