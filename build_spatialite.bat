setlocal
call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-4.3.0.tar.gz libspatialite-4.3.0

cd libspatialite-4.3.0

SET "PREFIX1=%PREFIX:\=/%"

if "%COMPILER%" == "MINGW" (
  SET PKG_CONFIG_PATH=/%PREFIX1::=%/lib/pkgconfig
  SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
rem   set "LIBXML2_CFLAGS=%CFLAGS%"
rem   set "LIBXML2_LIBS=%LDFLAGS%"
  if NOT EXIST Makefile (bash -c "./configure %CONFARGS%  --target=mingw32 --disable-examples")
  %ER%
  bash -c "make install"
  sed -i %PREFIX:\=/%/lib/libspatialite.la -e "s@-ldl@@g"
  %ER%

) else (

"%SEDC%" -i nmake.opt -e "s@INSTDIR=.*@INSTDIR=\$\(PREFIX\)@"

if "%Variant%" == "Debug" (
    "%SEDC%" -i nmake.opt -e "s@\/MD @\/MDd \/Zi @"
    "%SEDC%" -i nmake.opt -e "s@\/Ox@@"
)

"%SEDC%" -i makefile.vc -e "s@C:\\\\OSGeo4W@$(PREFIX)@g"
"%SEDC%" -i makefile.vc -e "s@C:\\\\OSGeo4w@$(PREFIX)@g"
"%SEDC%" -i makefile.vc -e "s@proj_i.lib@proj.lib@g"
"%SEDC%" -i makefile.vc -e "s@freexl_i.lib@freexl.lib@g"
"%SEDC%" -i makefile.vc -e "s@sqlite3_i.lib@sqlite3.lib@g"

"%SEDC%" -i config-msvc.h -e "s@HAVE_UNISTD_H@HAVE_NOT_UNISTD_H@g"
"%SEDC%" -i "src/gaiageo/gg_extras.c" -e "s@rint (double@oldrint (double@"

nmake -f makefile.vc install
%ER%
)