call settings.bat

git clone https://github.com/alex85k/wingetopt.git
cd wingetopt
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
%MAKE% install
cd ..
