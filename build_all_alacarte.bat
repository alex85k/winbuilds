set "ERRORS="
   call wlog.bat build_bzip.bat ^
&& call wlog.bat build_zlib.bat ^
&& call wlog.bat build_libpng.bat ^
&& call wlog.bat build_log4cpp.bat  ^
&& call wlog.bat build_freetype.bat ^
&& call wlog.bat build_pixman.bat ^
&& call wlog.bat build_cairo.bat ^
&& call wlog.bat build_alacarte.bat
echo Builds with errors: %ERRORS%
