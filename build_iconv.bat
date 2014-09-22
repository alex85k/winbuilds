setlocal
call settings.bat

if "%COMPILER%"=="MSVC2013" (
   git clone https://github.com/alex85k/libiconv.git
) else (
   git clone https://github.com/coapp-packages/libiconv.git
)

if "%COMPILER%" == "MINGW" (
   echo "Sorry, MINGW is not supported for now"
   exit /b 1
)

cd libiconv\COPKG\libiconv

msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo libiconv.vcxproj /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly

copy /y x64\%Variant%\*.lib %PREFIX%\lib
copy /y x64\%Variant%\libiconv.lib %PREFIX%\lib\iconv.lib
copy /y x64\%Variant%\*.dll %PREFIX%\bin
copy /y *.h %PREFIX%\include

cd ..\..\..

