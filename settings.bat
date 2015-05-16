if "%COMPILER%"=="" SET COMPILER=MSVC2013
if "%PREFIX%"=="" SET PREFIX=d:\libs18d
if "%BOOST_ROOT%"=="" SET BOOST_ROOT=d:\boost
if "%VARIANT%"=="" SET Variant=Debug

set "ER=if ERRORLEVEL 1 exit /b 1"
if "%COMPILER%"=="MINGW" (
  SET "PATH=%PATH%;c:\mingw64\bin"
  SET "MSYSDIR=c:\msys64\usr\bin"
  SET CMAKE_TARGET="MinGW Makefiles"
  SET "CFLAGS=-I%PREFIX:\=/%/include"
  SET "CPPFLAGS=-I%PREFIX:\=/%/include"
  SET "LDFLAGS=-L%PREFIX:\=/%/lib"
  SET "CONFARGS=--prefix=%PREFIX:\=/% --host=x86_64-w64-mingw32 --build=x86_64-w64-mingw32"
  set "CMAKE=cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%"
  SET "MAKEC=mingw32-make"
  SET "SEDC=sed"
  SET GENERATOR="MinGW Makefiles"
  SET PREFIX1=%PREFIX:\=/%
  SET "MSBUILDINSTALL=mingw32-make install"
) else (
  if "%COMPILER%"=="MSVC2008-32"  (
      set MSC_VER=9
     set "GENERATOR= -G"Visual Studio 12 2008""
      call "%VS90COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
  )
  if "%COMPILER%"=="MSVC2010-32"  (
      set MSC_VER=10
     set "GENERATOR= -G"Visual Studio 12 2010""
      call "%VS100COMNTOOLS%\..\..\VC\vcvarsall.bat" x86
  )
  if "%COMPILER%"=="MSVC2012"  (
     set MSC_VER=11
     set "GENERATOR= -G"Visual Studio 12 2012 Win64""
     call "%VS110COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
  )
  if "%COMPILER%"=="MSVC2013"  (
     set MSC_VER=12
     set "GENERATOR= -G"Visual Studio 12 2013 Win64""
     call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
  )
  if "%COMPILER%"=="MSVC2013-CTP"  (
     set MSC_VER=12
     set "GENERATOR= -G"Visual Studio 12 2013 Win64" -T CTP_Nov2013"
     call "%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat" x86_amd64
  )
  if "%COMPILER%"=="MSVC2015"  (
     set MSC_VER=14
     set "GENERATOR= -G"Visual Studio 14 2015 Win64""
     call "%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat" amd64
  )
  set "CMAKE=cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%"
  SET "MAKEC=nmake
  SET PREFIX1=%PREFIX:\=/%
  SET "MSBUILDINSTALL=msbuild /p:Configuration=%Variant% /p:BuildInParallel=true /clp:Verbosity=normal /nologo  /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly INSTALL.vcxproj"
  SET "SEDC=C:\Program Files (x86)\Git\bin\sed"
)

if NOT EXIST %PREFIX% mkdir %PREFIX%
if NOT EXIST %PREFIX%\include mkdir %PREFIX%\include
if NOT EXIST %PREFIX%\lib mkdir %PREFIX%\lib
if NOT EXIST %PREFIX%\bin mkdir %PREFIX%\bin

echo ============= %COMPILER% -- %VARIANT% --- %PREFIX% --- %CMAKE_TARGET% ==============

