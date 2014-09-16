call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/spatialite-tools-4.2.0.tar.gz spatialite-tools-4.2.0

cd spatialite-tools-4.2.0

"%SED%" -i nmake.opt -e s@INSTDIR=.*@INSTDIR=\$\(PREFIX\)@"
if "%Variant%" == "Debug" (
    "%SED%" -i nmake.opt -e "s@\/MD @\/MDd \/Zi @"
    "%SED%" -i nmake.opt -e "s@\/Ox@@"
)
"%SED%" -i makefile.vc -e s@C:\\\\OSGeo4W@$(PREFIX)@g"
"%SED%" -i makefile.vc -e s@C:\\\\OSGeo4w@$(PREFIX)@g"
"%SED%" -i makefile.vc -e s@sqlite3_i.lib@sqlite3.lib@g"
"%SED%" -i makefile.vc -e s@libexpat.lib@expat.lib@g"

nmake -f makefile.vc install
