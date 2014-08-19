call fetch.bat http://download.osgeo.org/shapelib/shapelib-1.3.0.zip shapelib-1.3.0

call settings.bat                                                                       

cd shapelib-1.3.0
if "%compiler%" == "MINGW" (
   mingw32-make
) else (
   nmake /f makefile.vc

copy /y *.lib %PREFIX%/lib
copy /y *.h %PREFIX%/include
copy /y *.exe %PREFIX%/bin

)
cd ..
   
