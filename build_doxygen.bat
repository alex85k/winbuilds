setlocal
call settings.bat

rem svn checkout http://svn.osgeo.org/geos/trunk geos-svn
git clone --depth 10 https://github.com/alex85k/doxygen.git

cd doxygen
mkdir build
cd build

cmake .. -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DICONV_DIR=%PREFIX% -DICONV_LIBRARY=%PREFIX%/lib/iconv.lib
%ER%
nmake install
%ER%

cd ..\..
