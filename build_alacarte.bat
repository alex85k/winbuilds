setlocal
call settings.bat

rem svn checkout http://svn.osgeo.org/geos/trunk geos-svn
git clone --depth 1 https://github.com/alex85k/alacarte.git

cd alacarte

mkdir build
cd build

cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBUILD_TESTS=ON -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.58;1.59
%ER%
%MSBUILDINSTALL%
%ER%

set PATH=%PATH%;%PREFIX%\bin
ctest -C %Variant% -VV >..\..\%~n0_tests.log

cd ..\..
                                  
