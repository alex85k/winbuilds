call settings.bat

git clone https://github.com/alex85k/expat.git
cd expat
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBUILD_shared=ON

%MAKE% clean install
cd ..
