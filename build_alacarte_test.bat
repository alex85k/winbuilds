setlocal
call settings.bat

cd alacarte
cd build

set PATH=%PATH%;%PREFIX%\bin
ctest -C %Variant% -VV >..\..\%~n0_tests.log

cd ..\..
                                  
