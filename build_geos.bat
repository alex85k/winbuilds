setlocal
call settings.bat

rem svn checkout http://svn.osgeo.org/geos/trunk geos-svn
git clone --depth 1 -b 3.6.1 https://github.com/libgeos/libgeos.git geos

cd geos

if "%COMPILER:MSVC=%"=="%COMPILER%" (
  svn patch ..\std_check.diff
  svn patch ..\mingw_geos_config.diff
  set "MOREOPTS=-j4"
)

rem "%SEDC%" -i CMakeLists.txt -e "s@OR MSVC13)@OR MSVC13 OR MSVC14)@"
if NOT EXIST .svn ( echo #define GEOS_SVN_REVISION "3.6.1" > geos_svn_revision.h )

cmake %GENERATOR% -DGEOS_ENABLE_TESTS=OFF -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%

cd ..
                                  
