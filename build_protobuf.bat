call settings.bat 

rem git clone https://github.com/cjh1/protobuf.git
rem git clone https://github.com/alex85k/protobuf.git
rem cd protobuf
rem cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
rem %MAKE% install

git clone https://github.com/alex85k/protobuf-cmake.git
git clone https://github.com/google/protobuf.git

set "PDIR=%CD%\protobuf"

cd protobuf-cmake
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DPROTOBUF_ROOT=%PDIR%
%MAKE%  install
ctest -VV 1>tests.log 2>&1
cd ..
