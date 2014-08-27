SET COMPILER=MSVC

SET PREFIX=d:\libs18d
SET BOOST_ROOT=d:\boost

SET VARIANT=Debug


if "%COMPILER%"=="MINGW" (
  SET "PATH=%PATH%;c:\mingw64_491seh\mingw64\bin;C:\msys\bin"
  SET CMAKE_TARGET="MinGW Makefiles"
  SET MAKE=mingw32-make
  SET "SED=sed"
) else (
  call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
  SET CMAKE_TARGET="NMake Makefiles"
  SET MAKE=nmake
  SET "SED=C:\Program Files (x86)\Git\bin\sed"
)


if NOT EXIST %PREFIX% mkdir %PREFIX%
if NOT EXIST %PREFIX%\include mkdir %PREFIX%\include
if NOT EXIST %PREFIX%\lib mkdir %PREFIX%\lib
