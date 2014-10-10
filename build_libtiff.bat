setlocal
call settings.bat

call fetch.bat  http://download.osgeo.org/libtiff/tiff-3.9.4.zip tiff-3.9.4

cd tiff-3.9.4

if "%compiler%" == "MINGW" (
   SET "PATH=%MSYSDIR%;c:\mingw64\bin;%PREFIX%\bin;%PATH%"
   if NOT EXIST Makefile (bash -c "./configure %CONFARGS%")
   %ER%
   bash -c "make install"
   %ER%
) else (
   if  "%Variant%" == "Debug"  (
rem   "%SEDC%" -i makefile.msc -e "s@-MD @ -MDd @"
)
   nmake /f makefile.vc install
   %ER%
)

cd ..
