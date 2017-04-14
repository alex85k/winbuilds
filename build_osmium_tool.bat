setlocal
call settings.bat

git clone https://github.com/osmcode/osmium-tool
cd osmium-tool

mkdir build
cd build

if "%COMPILER%" == "MINGW" (
   %CMAKE% .. -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.57
   %ER%
   mingw32-make
   %ER%
) else (
   cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% %CMAKE_BOOST_FLAGS%
   %ER%
   %MSBUILDINSTALL%
   %ER%
)
set PATH=%PREFIX%/bin;%PATH%
ctest -C %Variant% -VV >..\..\%~n0_tests.log

cd ..\..
