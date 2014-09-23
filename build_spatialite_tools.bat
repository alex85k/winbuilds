setlocal
call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/spatialite-tools-4.2.0.tar.gz spatialite-tools-4.2.0

cd spatialite-tools-4.2.0

if "%COMPILER%" == "MINGW" (

  SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
  set "LIBSPATIALITE_CFLAGS=%CFLAGS%"
  set "LIBSPATIALITE_LIBS=%LDFLAGS%"
  set "LIBFREEXL_CFLAGS=%CFLAGS%"
  set "LIBFREEXL_LIBS=%LDFLAGS%"
  set "LIBREADOSM_CFLAGS=%CFLAGS%"
  set "LIBREADOSM_LIBS=%LDFLAGS%"

  if NOT EXIST Makefile (bash -c "./configure --prefix=%PREFIX:\=/%")
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

rem MAKE THE MOST LIBS STATICALLY LINKED TO AVOID DLL CONFLICTS
"%SEDC%" -i makefile.vc -e "s@libexpat.lib@expat.lib@g"
"%SEDC%" -i makefile.vc -e "s@spatialite_i.lib@spatialite.lib $(PREFIX)\\\\lib\\\\freexl.lib $(PREFIX)\\\\lib\\\\libxml2.lib $(PREFIX)\\\\lib\\\\zlib.lib $(PREFIX)\\\\lib\\\geos_c.lib@g"
"%SEDC%" -i makefile.vc -e "s@proj_i.lib@proj.lib@g"
"%SEDC%" -i makefile.vc -e "s@readosm_i.lib@readosm.lib@g"
"%SEDC%" -i makefile.vc -e "s@sqlite3_i.lib@sqlite3.lib@g"

nmake -f makefile.vc install
%ER%
)