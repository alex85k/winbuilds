setlocal
call settings.bat

rem git clone https://github.com/DennisOSRM/stxxl.git
git clone https://github.com/stxxl/stxxl.git
rem git clone --depth 10 https://github.com/thk1/stxxl.git
rem git clone https://github.com/alex85k/stxxl.git

cd stxxl
mkdir build
cd build

set CXXFLAGS=/bigobj
rem cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBUILD_TESTS=ON
cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBUILD_TESTS=OFF -DBUILD_EXAMPLES=OFF
%ER%
%MSBUILDINSTALL%
%ER%

if  "%Variant%" == "Debug"  (
copy %PREFIX%\lib\stxxl_debug.lib %PREFIX%\lib\stxxl.lib
)

cd ..
cd ..