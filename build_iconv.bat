setlocal
call settings.bat

if "%COMPILER%" == "MINGW" (
   echo "Iconv should be already bundled with MINGW"
   exit /b 0
)  else (
   rem git clone https://github.com/pffang/libiconv-for-Windows.git
   git clone https://github.com/LuaDist/libiconv.git
)

cd libiconv
mkdir build
cd build
%CMAKE% ..
%ER%
%MAKEC% install
%ER%
rem rmdir /s /q obj lib lib64
rem msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo LibIconv.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
rem %MSBUILD%

copy /y  %PREFIX%\lib\libiconv.lib %PREFIX%\lib\iconv.lib
rem copy /y lib64\*.dll %PREFIX%\bin
rem copy /y include\*.h %PREFIX%\include

cd ..\..

