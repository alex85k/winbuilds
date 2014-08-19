call settings.bat

git clone https://github.com/LuaDist/lua.git
cd lua
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
%MAKE% install
cd ..

                                  
