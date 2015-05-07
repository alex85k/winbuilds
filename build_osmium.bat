setlocal
call settings.bat

git clone https://github.com/osmcode/libosmium.git libosmium


cd libosmium

mkdir build
cd build

set TESTS=ON
set ALLHPPS=OFF

if "%COMPILER%" == "MINGW" (
   %CMAKE% .. -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTING=%TESTS% -DBUILD_TRY_HPPS=%ALLHPPS% -DBoost_ADDITIONAL_VERSIONS=1.57
   %ER%
   mingw32-make
   %ER%
) else (
   cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTING=%TESTS% -DBUILD_TRY_HPPS=%ALLHPPS%  -DBoost_ADDITIONAL_VERSIONS=1.58 
   %ER%
   %MSBUILDINSTALL%
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

cd ..\..

