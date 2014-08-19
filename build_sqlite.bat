call settings.bat
                                  
git clone https://github.com/alex85k/sqlite3-cmake.git sqlite
cd sqlite
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
%MAKE% install 
cd ..
