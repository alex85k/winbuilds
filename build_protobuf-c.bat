call settings.bat

git clone https://github.com/alex85k/protobuf-c.git 
cd protobuf-c/build-cmake
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX%
%MAKE% install 
ctest
cd ..
cd ..


                                  
