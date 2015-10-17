setlocal
call settings.bat

set "PSQL_ROOT=C:\Program Files\PostgreSQL\9.4"
set PGUSER=postgres
set PGPASSWORD=admin

git clone -b cmake --depth 1 https://github.com/alex85k/osm2pgsql.git

cd osm2pgsql
mkdir build
cd build

set CMAKE_PREFIX_PATH=%PREFIX%;C:\Program Files\PostgreSQL\9.4

cmake .. -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DTEST_BUILD=OFF -DBoost_ADDITIONAL_VERSIONS=1.57;1.58;1.59
%ER%
nmake install
%ER%

cd ..\..
mkdir osm2pgsql-bin

copy /y osm2pgsql\build\%VARIANT%\*.exe osm2pgsql-bin
copy /y osm2pgsql\*.style osm2pgsql-bin
copy /y osm2pgsql\*.lua osm2pgsql-bin
copy /y %PREFIX%\bin\libxml2.dll osm2pgsql-bin
copy /y %PREFIX%\bin\lua.dll osm2pgsql-bin
copy /y %PREFIX%\bin\geos.dll osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\libpq.dll" osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\libintl-8.dll" osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\libeay32.dll" osm2pgsql-bin
copy /y "%PSQL_ROOT%\bin\ssleay32.dll" osm2pgsql-bin

