setlocal
call settings.bat

git clone -b cpp_conversion https://github.com/MapQuest/osm2pgsql.git osm2pgsql-cpp
cd osm2pgsql-cpp

if "%COMPILER%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
  if NOT EXIST configure (bash -c "./autogen.sh")
  bash -c "./configure %CONFARGS% --with-zlib-inc=%PREFIX:\=/%/include --with-zlib-lib=%PREFIX:\=/%/include --with-zlib-lib=%PREFIX:\=/%/lib/libz.a"
  %ER%
  bash -c "make install"
  %ER%
)

