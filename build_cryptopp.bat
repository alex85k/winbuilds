call settings.bat

rem git clone https://github.com/mpapierski/cryptopp-cmake.git cryptopp
git clone https://github.com/alex85k/cryptopp-cmake.git cryptopp

cd cryptopp
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%

%MAKE% install

cd ..