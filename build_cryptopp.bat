setlocal
call settings.bat

rem git clone https://github.com/mpapierski/cryptopp-cmake.git cryptopp
git clone https://github.com/alex85k/cryptopp-cmake.git cryptopp

cd cryptopp
%CMAKE%
%ER%
%MAKE% install
%ER%

cd ..