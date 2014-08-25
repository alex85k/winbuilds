call settings.bat

git clone https://github.com/bagder/curl
cd curl
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%

%MAKE% clean install
cd ..
