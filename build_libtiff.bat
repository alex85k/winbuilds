setlocal
call settings.bat

call fetch.bat  http://download.osgeo.org/libtiff/tiff-4.0.4.zip tiff-4.0.4

cd tiff-4.0.4

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
   nmake /f Makefile.vc lib
   %ER%
   copy /y libtiff\*.lib %PREFIX%\lib
   copy /y libtiff\*.dll %PREFIX%\bin
   copy /y libtiff\*.h %PREFIX%\include
rem    copy /y libbz2.a %PREFIX%\lib\bzip2.a
)

cd ..
