setlocal
call settings.bat

git clone https://github.com/OSGeo/gdal.git
cd gdal\gdal

git checkout tags/1.11.0
rem git clean -f -x

if "%COMPILER%" == "MINGW" (

set GDAL_HOME=%PREFIX%
rem  SET "PATH=%MSYSDIR%;C:\mingw64\bin;C:\Windows\System32\bin"
rem --host=x86_64-w64-mingw32 --build=x86_64-w64-mingw32 --host=mingw32  --without-libtool %PREFIX%\bin;
rem  SET "LDFLAGS=%LDFLAGS%  -lspatialite -lgeos_c -lsqlite3 -liconv"
  SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
  SET "PKG_CONFIG_PATH=/d/libsMGW/lib/pkgconfig"
  set "LIBS=-lspatialite -lsqlite3 -lgeos_c -lfreexl -lexpat -lproj -lxml2 -liconv -lz"
rem   copy /y ..\..\cpl_config.h port\cpl_config.h
  if NOT EXIST GDALmake.opt (bash -c "./configure %CONFARGS% --without-python --with-spatialite=%PREFIX:\=/% --with-expat=%PREFIX:\=/% --with-sqlite3=%PREFIX:\=/% --with-freexl=%PREFIX:\=/%" )
  %ER%
  bash -c "make install"
  %ER%
) else (

if "%COMPILER:32=%"=="%COMPILER%" (set "WIN64OPTS=-e s@#WIN64@WIN64@")

"%SEDC%" -i nmake.opt -b %WIN64OPTS% -e s@DLLBUILD=1@DLLBUILD=0@"

"%SEDC%" -i nmake.opt -e "s@#SQLITE_INC=.*@SQLITE_INC=-I$(PREFIX)\\\\include -DHAVE_SPATIALITE@"
"%SEDC%" -i nmake.opt -e "s@#SQLITE_LIB=.*@SQLITE_LIB=$(PREFIX)\\\\lib\\\\spatialite.lib $(PREFIX)\\\\lib\\\\geos_c.lib $(PREFIX)\\\\lib\\\\sqlite3.lib@"
"%SEDC%" -i nmake.opt -e "s@#SPATIALITE_412_OR_LATER@SPATIALITE_412_OR_LATER@"

"%SEDC%" -i nmake.opt -e "s@#LIBXML2_INC =.*@LIBXML2_INC = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#LIBXML2_LIB =.*@LIBXML2_LIB = $(PREFIX)\\\\lib\\\\libxml2_a.lib@"

"%SEDC%" -i nmake.opt -e "s@#FREEXL_CFLAGS =.*@FREEXL_CFLAGS = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#FREEXL_LIBS =.*@FREEXL_LIBS = $(PREFIX)\\\\lib\\\\freexl.lib@"

"%SEDC%" -i nmake.opt -e "s@#LIBICONV_INCLUDE =.*@LIBICONV_INCLUDE = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#LIBICONV_LIBRARY =.*@LIBICONV_LIBRARY = $(PREFIX)\\\\lib\\\\libiconv.lib@"
"%SEDC%" -i nmake.opt -e "s@#LIBICONV_CFLAGS =.*@LIBICONV_CFLAGS = -DICONV_CONST=const@"


"%SEDC%" -i nmake.opt -e "s@#PROJ_FLAGS =.*@PROJ_FLAGS = -DPROJ_STATIC@"
"%SEDC%" -i nmake.opt -e "s@#PROJ_INCLUDE =.*@PROJ_INCLUDE = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#PROJ_LIBRARY =.*@PROJ_LIBRARY = $(PREFIX)\\\\lib\\\\proj.lib@"

rem "%SEDC%" -i nmake.opt -e s@#SQLITE_LIB=.*@SQLITE_LIB=\$\(PREFIX\)\\\\lib\\\\sqlite3.lib@"
rem "%SEDC%" -i nmake.opt -e "s@#SQLITE_INC=.*@SQLITE_INC=-I\$\(PREFIX\)\\\\include@"

if "%Variant%" == "Debug" (
   set "DBG=DEBUG=1"
   "%SEDC%" -i nmake.opt -e "s@\/MD @\/MDd @"
) else (
   set DBG
)

nmake -f makefile.vc %DBG%
nmake -f makefile.vc %DBG% devinstall
cd ..\..

)
