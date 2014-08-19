call settings.bat 
                 
set src=%CD%
                
cd boost_1_56_0
call bootstrap.bat
bjam toolset=msvc-12.0 address-model=64 threading=multi link=static runtime-link=shared --prefix=%BOOST_ROOT% -sBZIP2_SOURCE="%src%\bzip2-1.0.6" -sZLIB_SOURCE="%src%\zlib-1.2.8" install
cd ..