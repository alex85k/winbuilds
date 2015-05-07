setlocal
call settings.bat

if "%COMPILER%" == "MINGW" (
   echo "Iconv should be already bundled with MINGW"
   exit /b 0
)  else (
   git clone https://github.com/alex85k/libiconv-for-Windows.git
)

cd libiconv-for-Windows

rmdir /s /q obj lib lib64
msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo LibIconv.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly

copy /y lib64\libiconvD.lib %PREFIX%\lib\iconv.lib
copy /y lib64\libiconv.lib %PREFIX%\lib\iconv.lib
copy /y lib64\*.dll %PREFIX%\bin
copy /y include\*.h %PREFIX%\include

cd ..\..\..

