setlocal
call settings.bat

git clone https://github.com/alex85k/osm2pgsql.git osm2pgsql-cpp
cd osm2pgsql-cpp
git checkout msvc-october1-cpp
cd build-cmake

copy CMakeLists.txt ..

if "%compiler%" == "MINGW" (
   SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
) else (
   set CMAKE_PREFIX_PATH=%PREFIX%;C:\Program Files\PostgreSQL\9.3
)

%CMAKE% ..  -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_PBF=ON -DBUILD_TESTS=ON
%ER%
%MAKEC% install
%ER%

cd ../..

mkdir osm2pgsql-cpp-bin
copy /y osm2pgsql-cpp\build-cmake\*.exe osm2pgsql-cpp-bin
copy /y osm2pgsql-cpp\default.style osm2pgsql-cpp-bin
copy /y osm2pgsql-cpp\style.lua osm2pgsql-cpp-bin
copy /y %PREFIX%\bin\libxml2.dll osm2pgsql-cpp-bin

if "%compiler%" == "MINGW" (
  copy /y "%PREFIX%\lib\libpq.dll" osm2pgsql-cpp-bin
  copy /y "c:\mingw64\bin\libgcc*.dll" osm2pgsql-cpp-bin
  copy /y "c:\mingw64\bin\libstd*.dll" osm2pgsql-cpp-bin
  copy /y "c:\mingw64\bin\libwinp*.dll" osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\liblua.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\libgeos.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\libproj*.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\zlib1.dll osm2pgsql-cpp-bin
) else (
  copy /y %PREFIX%\bin\lua.dll osm2pgsql-cpp-bin
  copy /y %PREFIX%\bin\geos.dll osm2pgsql-cpp-bin
  copy /y "C:\Program Files\PostgreSQL\9.3\bin\libpq.dll" osm2pgsql-cpp-bin
  copy /y "C:\Program Files\PostgreSQL\9.3\bin\libintl-8.dll" osm2pgsql-cpp-bin
  copy /y "C:\Program Files\PostgreSQL\9.3\bin\libeay32.dll" osm2pgsql-cpp-bin
  copy /y "C:\Program Files\PostgreSQL\9.3\bin\ssleay32.dll" osm2pgsql-cpp-bin
)

cd osm2pgsql-cpp/build-cmake
  set SRCDIR=%CD%\..
  set PATH=%CD%\..\..\osm2pgsql-cpp-bin;%PATH%
  ctest -VV
cd ../..
