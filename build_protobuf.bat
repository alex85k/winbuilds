call settings.bat 

rem git clone https://github.com/cjh1/protobuf.git
git clone https://github.com/alex85k/protobuf.git
cd protobuf
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
%MAKE% install
cd ..
