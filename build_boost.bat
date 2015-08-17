setlocal
call settings.bat 
echo "Downloading and unpacking Boost:"
call fetch.bat "http://downloads.sourceforge.net/project/boost/boost/1.59.0/boost_1_59_0.7z" boost_1_59_0 > nul
echo "OK"

set src=%CD%
                
cd boost_1_59_0

if "%COMPILER:-32=%"=="%COMPILER%"  (
  set "BITS=64"
) else (
  set "BITS=32"
)

if "%COMPILER:MSVC=%"=="%COMPILER%"  (
  set "TOOLSET=gcc"
  if NOT EXIST bjam.exe call bootstrap.bat mingw
) else (
  set "TOOLSET=msvc-%MSC_VER%.0"
  if NOT EXIST bjam.exe call bootstrap.bat
)
bjam toolset=%TOOLSET% address-model=%BITS% threading=multi link=static runtime-link=shared --prefix=%BOOST_ROOT% -sBZIP2_SOURCE="%src%\bzip2-1.0.6" -sZLIB_SOURCE="%src%\zlib-1.2.8" install
cd ..