setlocal
call settings.bat

git clone https://github.com/coapp-packages/expat.git
cd expat

if "%COMPILER%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PATH%"
  bash -c "./configure %CONFARGS%"
  %ER%
  bash -c "make clean install"
  %ER%
) else (
  "%SEDC%" -i lib/expat_external.h -e "s@defined(XML_STATIC)@1@"
  %CMAKE% -DBUILD_shared=Off
  %ER%
  %MAKEC% install
  %ER%
)

cd ..
