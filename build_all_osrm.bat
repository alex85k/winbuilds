set "ERRORS="
   call wlog.bat build_bzip.bat ^
&& call wlog.bat build_zlib.bat ^
&& call wlog.bat build_expat.bat  ^
&& call wlog.bat build_luajit.bat ^
&& call wlog.bat build_getopt.bat ^
&& call wlog.bat build_osmium.bat ^
&& call wlog.bat build_stxxl.bat ^
&& call wlog.bat build_osrm.bat

echo Builds with errors: %ERRORS%
