call settings.bat

git clone https://github.com/OSGeo/gdal.git
cd gdal\gdal

git checkout tags/1.11.0

set "WIN64OPTS=-e s@#WIN64@WIN64@"
set GDAL_HOME=%PREFIX%
set MSVC_VER=1800

"%SED%" -i nmake.opt -b %WIN64OPTS% -e s@DLLBUILD=1@DLLBUILD=0@"

if "%Variant%" == "Debug" (
   set "DBG=DEBUG=1"
   "%SED" -i nmake.opt -e "s@\/MD @\/MDd @"
) else (
   set DBG
)

nmake -f makefile.vc %DBG%
nmake -f makefile.vc %DBG% devinstall
cd ..\..
