setlocal
call settings.bat

git clone https://github.com/LuaDist/luajit

cd luajit

%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..

