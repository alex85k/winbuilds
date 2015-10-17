setlocal
call settings.bat

rem svn checkout http://svn.osgeo.org/geos/trunk geos-svn
git clone  https://github.com/alacarte-maps/alacarte.git

cd alacarte
git remote add my https://github.com/alex85k/alacarte.git


mkdir build
cd build

cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.58;1.59 -DBUILD_TESTS=ON
%ER%
%MSBUILD% tests.vcxproj
%ER%

cd ..\..
                                  
