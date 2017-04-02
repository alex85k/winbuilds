setlocal
call settings.bat

rem git clone https://github.com/LuaDist/luajit
git clone --depth 10 -b v2.1 https://github.com/LuaJIT/LuaJIT.git

cd luajit

cd src
call msvcbuild.bat

copy /y *.lib %PREFIX%\lib\
copy /y lua*.h %PREFIX%\include\
copy /y lua*.hpp %PREFIX%\include\
copy /y laux*.h %PREFIX%\include\
cd ..

