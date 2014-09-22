setlocal
call settings.bat

svn checkout http://svn.osgeo.org/geos/trunk geos-svn
git svn clone -r HEAD http://svn.osgeo.org/geos/trunk geos-svn

cd geos-svn
echo #define GEOS_SVN_REVISION "3.4.2.svn" > geos_svn_revision.h
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DGEOS_ENABLE_TESTS=OFF
%MAKE% install
cd ..
                                  
