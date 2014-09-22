if "%COMPILER%"=="" SET COMPILER=MSVC2013
if "%PREFIX%"=="" SET PREFIX=d:\libs18d
if "%BOOST_ROOT%"=="" SET BOOST_ROOT=d:\boost
if "%VARIANT%"=="" SET Variant=Debug

set "ER=if ERRORLEVEL 1 exit /b 1"
if "%COMPILER%"=="MINGW" (
  SET "PATH=%PATH%;c:\mingw64_491seh\mingw64\bin;C:\msys\bin"
  SET CMAKE_TARGET="MinGW Makefiles"
  SET MAKE=mingw32-make
  SET "SED=sed"
) else (
  if "%COMPILER%"=="MSVC2008-32"  ( call "%VS90COMNTOOLS%\..\..\VC\vcvarsall.bat" x86 )
  if "%COMPILER%"=="MSVC2010-32"  ( call "%VS100COMNTOOLS%\..\..\VC\vcvarsall.bat" x86 )
  if "%COMPILER%"=="MSVC2012"  ( call "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64 )
  if "%COMPILER%"=="MSVC2013"  ( call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64 )
  if "%COMPILER%"=="MSVC2014"  ( call "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" amd64 )
  set "CMAKE=cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%"
  SET "MAKE=nmake"
  SET "SED=C:\Program Files (x86)\Git\bin\sed"
)

if NOT EXIST %PREFIX% mkdir %PREFIX%
if NOT EXIST %PREFIX%\include mkdir %PREFIX%\include
if NOT EXIST %PREFIX%\lib mkdir %PREFIX%\lib

echo ============= %COMPILER% -- %VARIANT% --- %PREFIX% --- %CMAKE_TARGET% ==============

