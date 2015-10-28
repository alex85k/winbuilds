setlocal
call settings.bat

set "PSQL_ROOT=C:\Program Files\PostgreSQL\9.4"
set PGUSER=postgres
set PGPASSWORD=admin

git clone --depth 10 https://github.com/openstreetmap/osm2pgsql.git

cd osm2pgsql
mkdir build
cd build

set CMAKE_PREFIX_PATH=%PREFIX%;C:\Program Files\PostgreSQL\9.4

cmake .. -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTS=ON
%ER%
rem nmake test-expire-tiles
rem nmake test ARGS="--build-and-test"
rem nmake check
nmake install
rem install
%ER%

cd ..\..
mkdir osm2pgsql-bin

copy /y osm2pgsql\build\%VARIANT%\*.exe osm2pgsql-bin
copy /y osm2pgsql\*.style osm2pgsql-bin
copy /y osm2pgsql\*.lua osm2pgsql-bin
copy /y %PREFIX%\bin\lua.dll osm2pgsql-bin
copy /y %PREFIX%\bin\geos.dll osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\libpq.dll" osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\libintl-8.dll" osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\libeay32.dll" osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\ssleay32.dll" osm2pgsql-bin

