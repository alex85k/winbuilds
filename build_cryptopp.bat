setlocal
call settings.bat

rem git clone https://github.com/mpapierski/cryptopp-cmake.git cryptopp
git clone https://github.com/alex85k/cryptopp-cmake.git cryptopp

cd cryptopp
%CMAKE%
%ER%
del GNUMakefile
%MAKEC% install
%ER%

xcopy /d /y /e %PREFIX%\include\cryptopp %PREFIX%\include\crypto++\

cd ..