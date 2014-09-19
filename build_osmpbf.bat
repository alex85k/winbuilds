call settings.bat

git clone https://github.com/scrosby/OSM-binary
cd OSM-binary

%CMAKE%
%ER%
%MAKE% install
%ER%

cd ..

