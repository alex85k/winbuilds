SET COMPILER=MSVC

SET PREFIX=d:\libs18r
SET BOOST_ROOT=d:\boost

SET VARIANT=Release


if "%COMPILER%"=="MINGW" (
  SET "PATH=%PATH%;c:\mingw64_491seh\mingw64\bin;C:\msys\bin"
  SET CMAKE_TARGET="MinGW Makefiles"
  SET MAKE=mingw32-make
) else (
  call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
  SET CMAKE_TARGET="NMake Makefiles"
  SET MAKE=nmake
)              


if NOT EXIST %PREFIX% mkdir %PREFIX%
if NOT EXIST %PREFIX%\include mkdir %PREFIX%\include
if NOT EXIST %PREFIX%\lib mkdir %PREFIX%\lib
