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
   %CMAKE% .. %CMAKE_BOOST_FLAGS% -DOsmium_DEBUG=ON
   %ER%
   %MAKEC%
   %ER%
)
set PATH=%PREFIX%/bin;%PATH%
ctest -C %Variant% -VV >..\..\%~n0_tests.log

cd ..\..
