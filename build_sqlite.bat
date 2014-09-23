setlocal
call settings.bat
                                  
git clone https://github.com/alex85k/sqlite3-cmake.git sqlite
cd sqlite

%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..
