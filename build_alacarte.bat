setlocal
call settings.bat

rem svn checkout http://svn.osgeo.org/geos/trunk geos-svn
git clone --depth 1 https://github.com/alacarte-maps/alacarte.git

cd alacarte

mkdir build
cd build

cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.58;1.59
%ER%
%MSBUILDINSTALL%
%ER%
%MSBUILD% tests.vcxproj
%ER%

cd ..\..
                                  
