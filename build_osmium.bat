call settings.bat

git clone https://github.com/osmcode/libosmium.git libosmium

cd libosmium/build-cmake
set TESTS=ON
set ALLHPPS=OFF

if "%COMPILER%" == "MINGW" (
   %CMAKE% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTING=%TESTS% -DBUILD_TRY_HPPS=%ALLHPPS%
   mingw32-make
   %ER%
) else (
   cmake .. -G "Visual Studio 12 Win64" -DCMAKE_BUILD_TYPE=%Variant% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTING=%TESTS% -DBUILD_TRY_HPPS=%ALLHPPS% -T CTP_Nov2013
   %ER%
   msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo libosmium.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
   %ER%
)

set PATH=%PATH%;%PREFIX%/bin
if "%TESTS%"=="ON" ctest -VV >..\..\%~n0_tests.log

if "%COMPILER%" == "MINGW" (
   mingw32-make install
   %ER%
) else (
   msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo INSTALL.vcxproj
   %ER%
)

cd ..\..

