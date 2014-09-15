call settings.bat

call fetch.bat http://download.osgeo.org/proj/proj-4.8.0.zip proj-4.8.0

cd proj-4.8.0
set INSTDIR=d:\\libs18d
set PROJ_LIB_DIR=%INSTDIR%\\share


if "%Variant%" == "Debug" (
   set OPTFLAGS=	/nologo /Zi /MDd /Fdproj.pdb
) else (
   set OPTFLAGS=	/nologo /Ox /Op /MD
)

if "%compiler%" == "MINGW" (
  sh configure --prefix=/d/libs-mgw
  mingw32-make
) else (
  nmake /f makefile.vc install-all
)

copy /y src\*.pdb %PREFIX%\bin
copy /y src\*.pdb %PREFIX%\bin

cd ..
