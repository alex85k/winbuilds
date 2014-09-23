setlocal
call settings.bat

git clone https://github.com/LuaDist/lua.git
cd lua

%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..

                                  
