call settings.bat

if "%compiler%" == "MINGW" (
  SET FLAGS="compiler=mingw"  
) else (
  SET FLAGS="iconv=no" 
)

cd libxml2-2.9.1/win32
if  "%Variant%" == "Debug"  (
   cscript.exe configure.js debug=yes %FLAGS% prefix=%PREFIX%
) else (
   cscript.exe configure.js %FLAGS% prefix=%PREFIX%
)
if "%compiler%" == "MINGW" (
  mingw32-make install
) else (
  nmake install
)
cd ..\..

