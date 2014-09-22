setlocal
call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/spatialite-tools-4.2.0.tar.gz spatialite-tools-4.2.0

if "%COMPILER%" == "MINGW" (
   echo "Sorry, MINGW is not supported for now"
   exit /b 1
)

cd spatialite-tools-4.2.0

"%SED%" -i nmake.opt -e s@INSTDIR=.*@INSTDIR=\$\(PREFIX\)@"
if "%Variant%" == "Debug" (
    "%SED%" -i nmake.opt -e "s@\/MD @\/MDd \/Zi @"
    "%SED%" -i nmake.opt -e "s@\/Ox@@"
)
"%SED%" -i makefile.vc -e "s@C:\\\\OSGeo4W@$(PREFIX)@g"
"%SED%" -i makefile.vc -e "s@C:\\\\OSGeo4w@$(PREFIX)@g"

rem MAKE THE MOST LIBS STATICALLY LINKED TO AVOID DLL CONFLICTS
"%SED%" -i makefile.vc -e "s@libexpat.lib@expat.lib@g"
"%SED%" -i makefile.vc -e "s@spatialite_i.lib@spatialite.lib $(PREFIX)\\\\lib\\\\freexl.lib $(PREFIX)\\\\lib\\\\libxml2.lib $(PREFIX)\\\\lib\\\\zlib.lib $(PREFIX)\\\\lib\\\geos_c.lib@g"
"%SED%" -i makefile.vc -e "s@proj_i.lib@proj.lib@g"
"%SED%" -i makefile.vc -e "s@readosm_i.lib@readosm.lib@g"
"%SED%" -i makefile.vc -e "s@sqlite3_i.lib@sqlite3.lib@g"

nmake -f makefile.vc install
%ER%
