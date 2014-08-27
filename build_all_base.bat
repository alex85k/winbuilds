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

cmd /c build_bzip.bat
cmd /c build_zlib.bat
cmd /c build_libxml.bat
cmd /c build_proj.bat

cmd /c build_expat.bat
cmd /c build_libpng.bat
cmd /c build_lua.bat
cmd /c build_getopt.bat
cmd /c build_sqlite.bat
cmd /c build_shp.bat
