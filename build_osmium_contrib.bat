setlocal
call settings.bat

git clone https://github.com/osmcode/osmium-contrib
cd osmium-contrib

mkdir build-cmake
cd build-cmake

if "%COMPILER%" == "MINGW" (
   %CMAKE% .. -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.57
   %ER%
   mingw32-make
   %ER%
) else (
   cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBUILD_TESTING=%TESTS% -DBUILD_TRY_HPPS=%ALLHPPS%  -DBoost_ADDITIONAL_VERSIONS=1.58 
   %ER%
   %MSBUILDINSTALL%
   %ER%
)

cd ..\..
