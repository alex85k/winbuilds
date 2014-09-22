setlocal
call settings.bat

git clone https://github.com/bagder/curl
cd curl

%CMAKE%
%ER%
%MAKE% install
%ER%

cd ..
