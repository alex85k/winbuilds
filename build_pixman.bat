setlocal
call settings.bat

git clone https://github.com/CMakePorts/cmake.pixman.git pixman

cd pixman

cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%

cd ..
