call settings.bat


cd proj-4.8.0
if "%compiler%" == "MINGW" (
  sh configure --prefix=/d/libs-mgw
  mingw32-make
) else (
  nmake /f makefile.vc install-all
)
cd ..
