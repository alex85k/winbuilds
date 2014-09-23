setlocal
call settings.bat

call fetch.bat http://www.gaia-gis.it/gaia-sins/freexl-1.0.0g.zip freexl-1.0.0g

cd freexl-1.0.0g

if "%COMPILER%" == "MINGW" (
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

"%SEDC%" -i config-msvc.h -e "s@HAVE_UNISTD_H@HAVE_NOT_UNISTD_H@g"

"%SEDC%" -i "src/freexl.c" -e "s@round (double@round_old (double@"
"%SEDC%" -i "src/freexl.c" -e "s@lround (double@lround_old (double@"

nmake -f makefile.vc install
%ER%
)
