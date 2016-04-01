setlocal
call settings.bat

rem git clone https://github.com/DennisOSRM/stxxl.git
rem git clone https://github.com/stxxl/stxxl.git
git clone --depth 10 https://github.com/thk1/stxxl.git
rem git clone https://github.com/alex85k/stxxl.git

cd stxxl
mkdir build
cd build


cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBUILD_TESTS=ON
%ER%
%MSBUILDINSTALL%
%ER%

if  "%Variant%" == "Debug"  (
copy %PREFIX%\lib\stxxl_debug.lib %PREFIX%\lib\stxxl.lib
)

cd ..
cd ..