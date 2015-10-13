setlocal
call settings.bat

rem svn checkout http://svn.osgeo.org/geos/trunk geos-svn
rem git clone --depth 1 git://git.sv.nongnu.org/freetype/freetype2.git
call fetch.bat http://sourceforge.net/projects/log4cpp/files/log4cpp-1.1.2rc1.tar.gz log4cpp

cd log4cpp

mkdir build
cd build

cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%
copy %PREFIX%\lib\log4cppD.lib %PREFIX%\lib\log4cpp.lib

cd ..\..
                                  
