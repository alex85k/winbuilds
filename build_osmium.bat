setlocal
call settings.bat

git clone https://github.com/osmcode/osm-testdata
git clone https://github.com/osmcode/libosmium.git libosmium

cd libosmium

mkdir build
cd build

set TESTS=ON
set DATATEST=ON
set BUILD_HEADERS=OFF
set BUILD_BENCHMARKS=ON


if "%COMPILER%" == "MINGW" (
   %CMAKE% .. -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTING=%TESTS% -DBUILD_TRY_HPPS=%ALLHPPS% -DBoost_ADDITIONAL_VERSIONS=1.57
   %ER%
   mingw32-make
   %ER%
) else (
   cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% %CMAKE_BOOST_FLAGS% -DBUILD_TESTING=%TESTS% -DBUILD_HEADERS=%BUILD_HEADERS% -DBUILD_BENCHMARKS=%BUILD_BENCHMARKS% -DBUILD_DATA_TESTS=%DATATEST%
   %ER%
   %MSBUILD% libosmium.sln
   %ER%
)

set PATH=%PATH%;%PREFIX%/bin
if "%TESTS%"=="ON" ctest -C %Variant% -VV >..\..\%~n0_tests.log

if "%COMPILER%" == "MINGW" (
   mingw32-make install
   %ER%
) else (
   msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo INSTALL.vcxproj
   %ER%
)

mkdir %PREFIX%\include\protozero
xcopy /i /y /e ..\include\protozero %PREFIX%\include\protozero
mkdir %PREFIX%\include\utf8
xcopy /i /y /e ..\include\utf8 %PREFIX%\include\utf8

copy /y ..\include\utf8.h %PREFIX%\include
copy /y ..\include\gdalcpp.hpp %PREFIX%\include
cd ..\..

