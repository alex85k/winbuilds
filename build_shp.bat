setlocal
call settings.bat

call fetch.bat http://download.osgeo.org/shapelib/shapelib-1.4.0.zip shapelib-1.4.0

cd shapelib-1.4.0
if "%compiler%" == "MINGW" (
  SET "PATH=%PATH%;%MSYSDIR%"
  SET CC=gcc
  bash -c "make install PREFIX=%PREFIX:\=/%"
  %ER%
) else (
   if "%Variant%" == "Debug" (
     "%SEDC%" -i makefile.vc -e "s@\/MD @\/MDd @"
   )
   nmake /f makefile.vc
   %ER%

   copy /y *.lib %PREFIX%\lib
   copy /y *.h %PREFIX%\include
   copy /y *.exe %PREFIX%\bin
   copy /y *.dll %PREFIX%\bin
)
cd ..
   
