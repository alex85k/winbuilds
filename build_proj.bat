setlocal
call settings.bat

call fetch.bat http://download.osgeo.org/proj/proj-4.8.0.zip proj-4.8.0

cd proj-4.8.0

if "%compiler%" == "MINGW" (
  SET "PATH=%PATH%;%MSYSDIR%"
  if NOT EXIST Makefile (bash -c "./configure --prefix=%PREFIX:\=/%")
  %ER%
  bash -c "make install"
  %ER%
) else (
  if "%Variant%" == "Debug" (
     set OPTFLAGS=	/nologo /Zi /MDd /Fdproj.pdb
  ) else (
     set OPTFLAGS=	/nologo /Ox /Op /MD
  )
  set INSTDIR=%PREFIX%
  set PROJ_LIB_DIR=%INSTDIR%\\share
  nmake /f makefile.vc install-all
  %ER%
)

copy /y src\*.pdb %PREFIX%\bin
copy /y src\*.pdb %PREFIX%\bin

cd ..
