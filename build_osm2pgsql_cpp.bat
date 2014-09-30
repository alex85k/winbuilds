setlocal
call settings.bat

git clone https://github.com/alex85k/osm2pgsql.git osm2pgsql-cpp
cd osm2pgsql-cpp
git checkout msvc-september30-cpp
cd build-cmake

set CMAKE_PREFIX_PATH=%PREFIX%;C:\Program Files\PostgreSQL\9.3

copy CMakeLists.txt ..
%CMAKE% ..  -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
%ER%
%MAKEC% install
%ER%

cd ../..

mkdir osm2pgsql-cpp-bin
copy /y osm2pgsql-cpp\build-cmake\osm2pgsql.exe osm2pgsql-cpp-bin
copy /y osm2pgsql-cpp\default.style osm2pgsql-cpp-bin
copy /y osm2pgsql-cpp\style.lua osm2pgsql-cpp-bin
copy /y %PREFIX%\bin\lua.dll osm2pgsql-cpp-bin
copy /y %PREFIX%\bin\libxml2.dll osm2pgsql-cpp-bin
copy /y %PREFIX%\bin\geos.dll osm2pgsql-cpp-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\libpq.dll" osm2pgsql-cpp-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\libintl-8.dll" osm2pgsql-cpp-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\libeay32.dll" osm2pgsql-cpp-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\ssleay32.dll" osm2pgsql-cpp-bin

