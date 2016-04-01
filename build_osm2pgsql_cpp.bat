setlocal
call settings.bat

set "PSQL_ROOT=C:\Program Files\PostgreSQL\9.4"
set PGUSER=postgres
set PGPASSWORD=admin
set OSM2PGSQL=osm2pgsql-cmake

git clone https://github.com/alex85k/osm2pgsql-cmake.git %OSM2PGSQL%
cd %OSM2PGSQL%

if "%compiler%" == "MINGW" (
   SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
) else (
   set CMAKE_PREFIX_PATH=%PREFIX%;C:\Program Files\PostgreSQL\9.4
)

%CMAKE% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTS=ON -DBoost_ADDITIONAL_VERSIONS=1.57;1.58;1.59;1.60
%ER%
%MAKEC% install
%ER%

cd ..

mkdir osm2pgsql-cpp-bin

if "%compiler%" == "MINGW" (
  copy /y %OSM2PGSQL%\*.exe osm2pgsql-cpp-bin
  copy /y %OSM2PGSQL%\osm2pgsql-cpp\default.style osm2pgsql-cpp-bin
  copy /y %OSM2PGSQL%\osm2pgsql-cpp\style.lua osm2pgsql-cpp-bin
  copy /y "%PREFIX%\lib\libpq.dll" osm2pgsql-cpp-bin
  copy /y "c:\mingw64\bin\libgcc*.dll" osm2pgsql-cpp-bin
  copy /y "c:\mingw64\bin\libstd*.dll" osm2pgsql-cpp-bin
  copy /y "c:\mingw64\bin\libwinp*.dll" osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\libxml2.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\liblua.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\libgeos.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\libproj*.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\zlib1.dll osm2pgsql-cpp-bin
) else (
  copy /y %OSM2PGSQL%\*.exe osm2pgsql-cpp-bin
  copy /y %OSM2PGSQL%\osm2pgsql-cpp\default.style osm2pgsql-cpp-bin
  copy /y %OSM2PGSQL%\osm2pgsql-cpp\style.lua osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\libxml2.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\lua.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\geos.dll osm2pgsql-cpp-bin
  copy /y "%PSQL_ROOT%\bin\libpq.dll" osm2pgsql-cpp-bin
  copy /y "%PSQL_ROOT%\bin\libintl-8.dll" osm2pgsql-cpp-bin
  copy /y "%PSQL_ROOT%\bin\libeay32.dll" osm2pgsql-cpp-bin
  copy /y "%PSQL_ROOT%\bin\ssleay32.dll" osm2pgsql-cpp-bin
)

set "PATH=%CD%\osm2pgsql-cpp-bin;C:\Python27;%PATH%"
cd %OSM2PGSQL%
echo "Running tests - see build_osm2pgsql_cpp_testing.log..."
rem %CD%;%PREFIX%\bin;C:\Program Files\PostgreSQL\9.3;%PATH%
ctest -VV >..\build_osm2pgsql_cpp_testing.log 2>&1
%ER%
echo "Tests passed"
cd ..
