setlocal
call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/readosm-1.0.0e.tar.gz readosm-1.0.0e

cd readosm-1.0.0e

if NOT EXIST %PREFIX%\include\expat.h ( echo "Sorry, need expat to build" & exit /b 1 )

if "%Compiler%"=="MINGW" (
  SET "PATH=%MSYSDIR%;%PATH%"
  if NOT EXIST Makefile (bash -c "./configure %CONFARGS%")
  %ER%
  bash -c "make install"
  %ER%
) else (
"%SEDC%" -i nmake.opt -e "s@INSTDIR=.*@INSTDIR=\$\(PREFIX\)@"

if "%Variant%" == "Debug" (
    "%SEDC%" -i nmake.opt -e "s@\/MD @\/MDd \/Zi @"
    "%SEDC%" -i nmake.opt -e "s@\/Ox@@"
)

"%SEDC%" -i makefile.vc -e "s@C:\\\\OSGeo4W@$(PREFIX)@g"
"%SEDC%" -i makefile.vc -e "s@C:\\\\OSGeo4w@$(PREFIX)@g"
"%SEDC%" -i makefile.vc -e "s@libexpat.lib@expat.lib@g"
"%SEDC%" -i makefile.vc -e "s@sqlite3_i.lib@sqlite3.lib@g"

nmake -f makefile.vc install
%ER%
)
