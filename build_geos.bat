setlocal
call settings.bat

svn checkout http://svn.osgeo.org/geos/trunk geos-svn
rem git svn clone -r HEAD http://svn.osgeo.org/geos/trunk geos-svn


cd geos-svn
if "%COMPILER:MSVC=%"=="%COMPILER%" (
  svn patch ..\std_check.diff
  svn patch ..\mingw_geos_config.diff
  set "MOREOPTS=-j4"
)

if NOT EXIST .svn ( echo #define GEOS_SVN_REVISION "3.4.2.svn" > geos_svn_revision.h )
%CMAKE% -DGEOS_ENABLE_TESTS=OFF
%MAKEC% install %MOREOPTS%
cd ..
                                  
