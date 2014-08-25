rem Tested with unpacked archives from
rem http://zlib.net/zlib-1.2.8.tar.gz
rem http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz

call fetch.bat http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz bzip2-1.0.6
call fetch.bat http://zlib.net/zlib-1.2.8.tar.gz zlib-1.2.8
call fetch.bat ftp://xmlsoft.org/libxml2/libxml2-2.9.1.tar.gz libxml2-2.9.1
call fetch.bat http://download.osgeo.org/proj/proj-4.8.0.zip proj-4.8.0
call fetch.bat ftp://ftp.simplesystems.org/pub/png/src/libpng16/lpng1612.7z lpng1612

call settings.bat	
if  "%Variant%" == "Debug"  (
   git apply debug.patch
) else (
   git apply release.patch
)

call build_bzip.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call build_zlib.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call build_libxml.bat
if %errorlevel% neq 0 exit /b %errorlevel%
call build_proj.bat
if %errorlevel% neq 0 exit /b %errorlevel%

call build_expat.bat
call build_libpng.bat
call build_lua.bat
call build_getopt.bat
call build_sqlite.bat
call build_shp.bat
