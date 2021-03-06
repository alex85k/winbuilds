setlocal
call settings.bat

rem git clone https://github.com/cjh1/protobuf.git
rem git clone https://github.com/alex85k/protobuf.git
rem cd protobuf
rem cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
rem %MAKEC% install

git clone https://github.com/alex85k/protobuf-cmake.git
git clone -b v2.6.1 https://github.com/google/protobuf.git

set "PDIR=%CD%\protobuf"

cd protobuf-cmake

cmake %GENERATOR% -DPROTOBUF_ROOT=%PDIR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%

rem ctest -VV 1>tests.log 2>&1
cd ..
