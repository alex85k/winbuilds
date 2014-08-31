call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/freexl-1.0.0g.zip freexl-1.0.0g

cd freexl-1.0.0g

"%SED%" -i nmake.opt -e s@INSTDIR=.*@INSTDIR=\$\(PREFIX\)@"

if "%Variant%" == "Debug" (
   "%SED%" -i nmake.opt -e "s@\/MD @\/MDd \/Zi @"
   "%SED%" -i nmake.opt -e "s@\/Ox@@"
)

"%SED%" -i makefile.vc -e s@C:\\\\OSGeo4W@$\(PREFIX\)@g"
"%SED%" -i makefile.vc -e s@C:\\\\OSGeo4w@$\(PREFIX\)@g"

"%SED%" -i config-msvc.h -e s@HAVE_UNISTD_H@HAVE_NOT_UNISTD_H@g"

"%SED%" -i "src/freexl.c" -e "s@round (double@round_old (double@"
"%SED%" -i "src/freexl.c" -e "s@lround (double@lround_old (double@"

nmake -f makefile.vc install
