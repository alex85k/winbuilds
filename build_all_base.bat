set "ERRORS="
call wlog.bat build_bzip.bat ^
&& call wlog.bat build_zlib.bat ^
&& call wlog.bat build_lua.bat ^
&& call wlog.bat build_libxml.bat ^
&& call wlog.bat build_proj.bat ^
&& call wlog.bat build_expat.bat  ^
&& call wlog.bat build_libpng.bat ^
&& call wlog.bat build_getopt.bat ^
&& call wlog.bat build_sqlite.bat ^
&& call wlog.bat build_sparsehash.bat ^
&& call wlog.bat build_shp.bat

echo Builds with errors: %ERRORS%

