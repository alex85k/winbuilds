setlocal
call settings.bat

git clone https://github.com/LuaDist/libjpeg

cd libjpeg
%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..
