setlocal
call settings.bat

cd alacarte
cd build

set PATH=%PATH%;%PREFIX%\bin
ctest -VV >..\..\%~n0_tests.log

cd ..\..
                                  
