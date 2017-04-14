setlocal
call settings.bat

git clone --depth 1  https://github.com/libexpat/libexpat.git
cd libexpat/expat
rem -b R_2_2_0

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

copy /y %PREFIX%\lib\expatd.lib %PREFIX%\lib\expat.lib
cd ../..
