setlocal
call settings.bat 
echo "Downloading and unpacking Boost:"
call fetch.bat "http://downloads.sourceforge.net/project/boost/boost/1.63.0/boost_1_63_0.7z" boost_1_63_0 > nul
echo "OK"

set src=%CD%
                
cd boost_1_63_0


set "TOOLSET=msvc-%MSC_VER%.0"
if NOT EXIST bjam.exe call bootstrap.bat

if NOT EXIST "%BOOST_ROOT%/include/boost-1_63/boost" (
  mkdir "%BOOST_ROOT%/include/boost-1_63/boost"
  xcopy /y /e /q boost "%BOOST_ROOT%/include/boost-1_63/boost"
)

bjam toolset=%TOOLSET% address-model=64 threading=multi link=shared runtime-link=shared ^
   variant=debug,release --prefix=%BOOST_ROOT% ^
   -sBZIP2_SOURCE="%src%\bzip2-1.0.6" -sZLIB_SOURCE="%src%\zlib-1.2.11" ^
   --with-python ^
   install
cd ..
