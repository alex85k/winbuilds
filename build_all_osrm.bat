set "ERRORS="
   call wlog.bat build_bzip.bat ^
&& call wlog.bat build_zlib.bat ^
&& call wlog.bat build_expat.bat  ^
&& call wlog.bat build_lua.bat ^
&& call wlog.bat build_getopt.bat ^
&& call wlog.bat build_protobuf.bat ^
&& call wlog.bat build_osmpbf.bat ^
&& call wlog.bat build_stxxl.bat ^
&& call wlog.bat build_luabind.bat ^
&& call wlog.bat build_osrm.bat

echo Builds with errors: %ERRORS%
