setlocal
call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-4.2.0.tar.gz libspatialite-4.2.0

cd libspatialite-4.2.0

if "%COMPILER%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
  set "LIBXML2_CFLAGS=%CFLAGS%"
  set "LIBXML2_LIBS=%LDFLAGS%"
  if NOT EXIST Makefile (bash -c "./configure %CONFARGS% --disable-examples")
  %ER%
  bash -c "make install -j4"
  %ER%

) else (

"%SEDC%" -i nmake.opt -e "s@INSTDIR=.*@INSTDIR=\$\(PREFIX\)@"

if "%Variant%" == "Debug" (
    "%SEDC%" -i nmake.opt -e "s@\/MD @\/MDd \/Zi @"
    "%SEDC%" -i nmake.opt -e "s@\/Ox@@"
)

"%SEDC%" -i makefile.vc -e "s@C:\\\\OSGeo4W@$(PREFIX)@g"
"%SEDC%" -i makefile.vc -e "s@C:\\\\OSGeo4w@$(PREFIX)@g"
"%SEDC%" -i makefile.vc -e "s@\$\(PREFIX\)\\\\lib\\\\proj_i.lib@$(PREFIX)\\\\lib\\\\proj.lib@g"
"%SEDC%" -i makefile.vc -e "s@CFLAGS = \/nologo@CFLAGS = -I$(PREFIX)\\\\include \/nologo@g"
"%SEDC%" -i makefile.vc -e "s@sqlite3_i.lib@sqlite3.lib@g"

"%SEDC%" -i config-msvc.h -e "s@HAVE_UNISTD_H@HAVE_NOT_UNISTD_H@g"
"%SEDC%" -i "src/gaiageo/gg_extras.c" -e "s@rint (double@oldrint (double@"

nmake -f makefile.vc install
%ER%
)