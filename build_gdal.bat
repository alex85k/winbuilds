call settings.bat

git clone https://github.com/OSGeo/gdal.git
cd gdal\gdal

git checkout tags/1.11.0

set "WIN64OPTS=-e s@#WIN64@WIN64@"
set GDAL_HOME=%PREFIX%
set MSVC_VER=1800

"%SED%" -i nmake.opt -b %WIN64OPTS% -e s@DLLBUILD=1@DLLBUILD=0@"

"%SED%" -i nmake.opt -e "s@#SQLITE_INC=.*@SQLITE_INC=-I$(PREFIX)\\\\include -DHAVE_SPATIALITE@"
"%SED%" -i nmake.opt -e "s@#SQLITE_LIB=.*@SQLITE_LIB=$(PREFIX)\\\\lib\\\\spatialite.lib $(PREFIX)\\\\lib\\\\geos_c.lib $(PREFIX)\\\\lib\\\\sqlite3.lib@"
"%SED%" -i nmake.opt -e "s@#SPATIALITE_412_OR_LATER@SPATIALITE_412_OR_LATER@"

"%SED%" -i nmake.opt -e "s@#LIBXML2_INC =.*@LIBXML2_INC = -I$(PREFIX)\\\\include@"
"%SED%" -i nmake.opt -e "s@#LIBXML2_LIB =.*@LIBXML2_LIB = $(PREFIX)\\\\lib\\\\libxml2_a.lib@"

"%SED%" -i nmake.opt -e "s@#FREEXL_CFLAGS =.*@FREEXL_CFLAGS = -I$(PREFIX)\\\\include@"
"%SED%" -i nmake.opt -e "s@#FREEXL_LIBS =.*@FREEXL_LIBS = $(PREFIX)\\\\lib\\\\freexl.lib@"

"%SED%" -i nmake.opt -e "s@#LIBICONV_INCLUDE =.*@LIBICONV_INCLUDE = -I$(PREFIX)\\\\include@"
"%SED%" -i nmake.opt -e "s@#LIBICONV_LIBRARY =.*@LIBICONV_LIBRARY = $(PREFIX)\\\\lib\\\\libiconv.lib@"
"%SED%" -i nmake.opt -e "s@#LIBICONV_CFLAGS =.*@LIBICONV_CFLAGS = -DICONV_CONST=const@"


"%SED%" -i nmake.opt -e "s@#PROJ_FLAGS =.*@PROJ_FLAGS = -DPROJ_STATIC@"
"%SED%" -i nmake.opt -e "s@#PROJ_INCLUDE =.*@PROJ_INCLUDE = -I$(PREFIX)\\\\include@"
"%SED%" -i nmake.opt -e "s@#PROJ_LIBRARY =.*@PROJ_LIBRARY = $(PREFIX)\\\\lib\\\\proj.lib@"

rem "%SED%" -i nmake.opt -e s@#SQLITE_LIB=.*@SQLITE_LIB=\$\(PREFIX\)\\\\lib\\\\sqlite3.lib@"
rem "%SED%" -i nmake.opt -e "s@#SQLITE_INC=.*@SQLITE_INC=-I\$\(PREFIX\)\\\\include@"

if "%Variant%" == "Debug" (
   set "DBG=DEBUG=1"
   "%SED%" -i nmake.opt -e "s@\/MD @\/MDd @"
) else (
   set DBG
)

nmake -f makefile.vc %DBG%
nmake -f makefile.vc %DBG% devinstall
cd ..\..
