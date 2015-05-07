setlocal
call settings.bat

call fetch.bat http://download.osgeo.org/proj/proj-4.9.1.tar.gz proj-4.9.1
cd proj-4.9.1

set INSTDIR=%PREFIX:\=\\%
if "%compiler%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PATH%"
  if NOT EXIST Makefile (bash -c "./configure %CONFARGS%")
  %ER%
  bash -c "make install"
  %ER%
) else (
  if "%Variant%" == "Debug" (
     set OPTFLAGS=	/nologo /Zi /MDd /Fdproj.pdb
  ) else (
     set OPTFLAGS=	/nologo /Ox /Op /MD
  )
  set PROJ_LIB_DIR=%INSTDIR%\\share
  nmake /f makefile.vc install-all
  %ER%
)

copy /y src\*.pdb %PREFIX%\bin

cd ..
