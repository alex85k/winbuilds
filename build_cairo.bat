setlocal
call settings.bat

git clone --depth 1 https://github.com/Mixaill/cmake.cairo.git cairo

cd cairo

cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%

cd ..
