call settings.bat

git clone https://github.com/alex85k/osm2pgsql.git
cd osm2pgsql
git checkout msvc-september2014
cd build-cmake

set CMAKE_PREFIX_PATH=%PREFIX%;C:\Program Files\PostgreSQL\9.3

cmake .. -G "NMake Makefiles" -DBUILD_PBF=ON -DCMAKE_BUILD_TYPE=%Variant%  
nmake
cd ../..

mkdir osm2pgsql-bin
copy /y osm2pgsql\build-cmake\osm2pgsql.exe osm2pgsql-bin
copy /y osm2pgsql\default.style osm2pgsql-bin
copy /y osm2pgsql\style.lua osm2pgsql-bin
copy /y %PREFIX%\bin\lua.dll osm2pgsql-bin
copy /y %PREFIX%\bin\libxml2.dll osm2pgsql-bin
copy /y %PREFIX%\bin\geos.dll osm2pgsql-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\libpq.dll" osm2pgsql-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\libintl-8.dll" osm2pgsql-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\libeay32.dll" osm2pgsql-bin
copy /y "C:\Program Files\PostgreSQL\9.3\bin\ssleay32.dll" osm2pgsql-bin

