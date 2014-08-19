call settings.bat

cd lpng1612
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
%MAKE% install
cd ..
