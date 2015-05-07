setlocal
call settings.bat

rem git clone https://github.com/DennisOSRM/stxxl.git
git clone https://github.com/stxxl/stxxl.git

cd stxxl
mkdir build
cd build


cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
%ER%
%MSBUILDINSTALL%
%ER%

cd ..
cd ..