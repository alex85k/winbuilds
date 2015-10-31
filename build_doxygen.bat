setlocal
call settings.bat

git clone --depth 10 https://github.com/doxygen/doxygen.git

cd doxygen
mkdir build
cd build

cmake .. -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DICONV_DIR=%PREFIX% -DICONV_LIBRARY=%PREFIX%/lib/iconv.lib
%ER%
nmake install
%ER%

cd ..\..
