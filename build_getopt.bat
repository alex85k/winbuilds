setlocal
call settings.bat

git clone https://github.com/alex85k/wingetopt.git
cd wingetopt

%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..
