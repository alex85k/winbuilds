call settings.bat


git clone https://github.com/osmcode/libosmium.git libosmium

cd libosmium/build-cmake
set TESTS=ON
set ALLHPPS=OFF
cmake .. -G "Visual Studio 12 Win64" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTING=%TESTS% -DBUILD_TRY_HPPS=%ALLHPPS% -T CTP_Nov2013
msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo libosmium.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly

set PATH=%PATH%;%PREFIX%/bin
if "%TESTS%"=="ON" ctest -VV >build_tests.log

msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo INSTALL.vcxproj

cd ..\..

