setlocal
call settings.bat

git clone https://github.com/alex85k/wingetopt.git
cd wingetopt

%CMAKE%
%ER%
%MAKE% install
%ER%

cd ..
