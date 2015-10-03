set "ERRORS="
   call wlog.bat build_bzip.bat ^
&& call wlog.bat build_iconv.bat ^
&& call wlog.bat build_libpng.bat ^
&& call wlog.bat build_sqlite.bat ^
&& call wlog.bat build_freexl.bat ^
&& call wlog.bat build_geos.bat ^
&& call wlog.bat build_readosm.bat ^
&& call wlog.bat build_spatialite.bat ^
&& call wlog.bat build_spatialite_tools.bat ^
&& call wlog.bat build_curl.bat ^
&& del /y %prefix%\bin\curl.exe ^
&& call wlog.bat build_gdal2.bat

echo Builds with errors: %ERRORS%
