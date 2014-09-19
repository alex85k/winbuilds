call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-4.2.0.tar.gz libspatialite-4.2.0

if "%COMPILER%" == "MINGW" (
   echo "Sorry, MINGW is not supported for now"
   exit /b 1
)

cd libspatialite-4.2.0

"%SED%" -i nmake.opt -e s@INSTDIR=.*@INSTDIR=\$\(PREFIX\)@"

if "%Variant%" == "Debug" (
    "%SED%" -i nmake.opt -e "s@\/MD @\/MDd \/Zi @"
    "%SED%" -i nmake.opt -e "s@\/Ox@@"
)

"%SED%" -i makefile.vc -e "s@C:\\\\OSGeo4W@$(PREFIX)@g"
"%SED%" -i makefile.vc -e "s@C:\\\\OSGeo4w@$(PREFIX)@g"
"%SED%" -i makefile.vc -e "s@\$\(PREFIX\)\\\\lib\\\\proj_i.lib@$(PREFIX)\\\\lib\\\\proj.lib@g"
"%SED%" -i makefile.vc -e "s@CFLAGS = \/nologo@CFLAGS = -I$(PREFIX)\\\\include \/nologo@g"
"%SED%" -i makefile.vc -e "s@sqlite3_i.lib@sqlite3.lib@g"

"%SED%" -i config-msvc.h -e "s@HAVE_UNISTD_H@HAVE_NOT_UNISTD_H@g"
"%SED%" -i "src/gaiageo/gg_extras.c" -e "s@rint (double@oldrint (double@"

nmake -f makefile.vc install
%ER%
