set "ERRORS="
call wlog.bat build_luabind.bat ^
&& cmd /c build_stxxl.bat ^
&& cmd /c build_curl.bat ^
&& cmd /c build_cryptopp.bat
echo Builds with errors: %ERRORS%


