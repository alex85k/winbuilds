call settings.bat

git clone https://github.com/coapp-packages/libiconv.git

if "%COMPILER%" == "MINGW" (
   echo "Sorry, MINGW is not supported for now"
   exit /b 1
)

cd libiconv\COPKG\libiconv
devenv  libiconv.sln /Upgrade /nologo
msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo libiconv.vcxproj /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly

copy /y x64\%Variant%\*.lib %PREFIX%\lib
copy /y x64\%Variant%\libiconv.lib %PREFIX%\lib\iconv.lib
copy /y x64\%Variant%\*.dll %PREFIX%\bin
copy /y *.h %PREFIX%\include

cd ..\..\..

