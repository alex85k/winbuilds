set "ERRORS="
   call wlog.bat build_protobuf.bat ^
&& call wlog.bat build_osmpbf.bat ^
&& call wlog.bat build_protobuf-c.bat

echo Builds with errors: %ERRORS%
