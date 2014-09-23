setlocal
call settings.bat

git clone https://github.com/scrosby/OSM-binary
cd OSM-binary

%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..

