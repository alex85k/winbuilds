setlocal
call settings.bat

set PYDIR=C:\Python27

git clone --depth 1 -b tags/2.1.3 https://github.com/OSGeo/gdal.git gdal2
cd gdal2\gdal

if "%1"=="clean" (git clean -f -x)

SET "PREFIX1=%PREFIX:\=/%"
set GDAL_HOME=%PREFIX%

if "%COMPILER%" == "MINGW" (
  SET PKG_CONFIG_PATH=/%PREFIX1::=%/lib/pkgconfig
  SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
rem set "LIBS=-lspatialite -lsqlite3 -lgeos_c -lfreexl -lexpat -lproj -lxml2 -liconv -lz"
  if NOT EXIST GDALmake.opt (bash -c "./configure %CONFARGS% --without-libtool --disable-static --enable-shared --without-python --with-spatialite=%PREFIX:\=/% --with-expat=%PREFIX:\=/% --with-sqlite3=%PREFIX:\=/% --with-freexl=%PREFIX:\=/" )
  %ER%
rem Build EXEs against DLL, not static .a
  bash -c "sed -i GDALmake.opt -e 's@endif # HAVE_LIBTOOL@endif # HAVE_LIBTOOL\nEXE_DEP_LIBS=$(GDAL_SLIB)@g'"
rem Omit GDAL_ROOT to shorten command line
  bash -c "sed -i GNUmakefile -e 's@\$(GDAL_ROOT)\/@@g'"
  bash -c "make install"
  %ER%
  copy /y %PREFIX%\lib\libgdal.dll %PREFIX%\bin
) else (

if "%COMPILER:32=%"=="%COMPILER%" (
  "%SEDC%" -i nmake.opt -e "s@#WIN64@WIN64@"
)


rem echo "Using latest cpl_config.h.vc file to support newer compilers"
rem  git checkout origin/HEAD port/cpl_config.h.vc

rem "%SEDC%" -i nmake.opt -e "s@DLLBUILD=1@DLLBUILD=0@"

"%SEDC%" -i nmake.opt -e "s@#SQLITE_INC=.*@SQLITE_INC=-I$(PREFIX)\\\\include -DHAVE_SPATIALITE@"
"%SEDC%" -i nmake.opt -e "s@#SQLITE_LIB=.*@SQLITE_LIB=$(PREFIX)\\\\lib\\\\spatialite.lib $(PREFIX)\\\\lib\\\\geos_c.lib $(PREFIX)\\\\lib\\\\sqlite3.lib@"
"%SEDC%" -i nmake.opt -e "s@#SPATIALITE_412_OR_LATER@SPATIALITE_412_OR_LATER@"

"%SEDC%" -i nmake.opt -e "s@#LIBXML2_INC =.*@LIBXML2_INC = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#LIBXML2_LIB =.*@LIBXML2_LIB = $(PREFIX)\\\\lib\\\\libxml2_a.lib@"

"%SEDC%" -i nmake.opt -e "s@#FREEXL_CFLAGS =.*@FREEXL_CFLAGS = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#FREEXL_LIBS =.*@FREEXL_LIBS = $(PREFIX)\\\\lib\\\\freexl.lib@"

"%SEDC%" -i nmake.opt -e "s@#LIBICONV_INCLUDE =.*@LIBICONV_INCLUDE = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#LIBICONV_LIBRARY =.*@LIBICONV_LIBRARY = $(PREFIX)\\\\lib\\\\iconv.lib $(PREFIX)\\\\lib\\\\libcharset.lib@"
"%SEDC%" -i nmake.opt -e "s@#LIBICONV_CFLAGS =.*@LIBICONV_CFLAGS = -DICONV_CONST -DWIN32@"


"%SEDC%" -i nmake.opt -e "s@#PROJ_FLAGS =.*@PROJ_FLAGS = -DPROJ_STATIC@"
"%SEDC%" -i nmake.opt -e "s@#PROJ_INCLUDE =.*@PROJ_INCLUDE = -I$(PREFIX)\\\\include@"
"%SEDC%" -i nmake.opt -e "s@#PROJ_LIBRARY =.*@PROJ_LIBRARY = $(PREFIX)\\\\lib\\\\proj.lib@"

"%SEDC%" -i nmake.opt -e "s@= odbc32.lib@= legacy_stdio_definitions.lib odbc32.lib@"


rem "%SEDC%" -i nmake.opt -e "s@ODBC_SUPPORTED = 1@#ODBC_SUPPORTED = 1@"

rem "%SEDC%" -i nmake.opt -e s@#SQLITE_LIB=.*@SQLITE_LIB=\$\(PREFIX\)\\\\lib\\\\sqlite3.lib@"
rem "%SEDC%" -i nmake.opt -e "s@#SQLITE_INC=.*@SQLITE_INC=-I\$\(PREFIX\)\\\\include@"

if "%Variant%" == "Debug" (
   set "DBG=DEBUG=1"
   "%SEDC%" -i nmake.opt -e "s@\/MD @\/MDd @"
) else (
   set DBG
)

nmake -f makefile.vc %DBG%
%ER%
nmake -f makefile.vc %DBG% devinstall
%ER%
ECHO -------------  Installed to %PREFIX%  --------------

cd ..\..

)
