setlocal
call settings.bat

rem svn checkout http://svn.osgeo.org/geos/trunk geos-svn
git clone --depth 1 git://git.sv.nongnu.org/freetype/freetype2.git

cd freetype2

mkdir build
cd build

cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%

cd ..\..
                                  
