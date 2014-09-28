setlocal
call settings.bat

git clone -b develop https://github.com/philsquared/Catch.git
cd Catch\Projects\CMake

if "%COMPILER%"=="MINGW" (
  set "CFLAGS=%CFLAGS% -fpermissive"
)

%CMAKE% 
%ER%
%MAKEC%
%ER%
ctest -VV
%ER%

cd ..\..\..

