setlocal
call settings.bat

git clone https://github.com/LuaDist/lua.git
cd lua

%CMAKE%
%ER%
%MAKE% install
%ER%

cd ..

                                  
