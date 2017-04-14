setlocal
call settings.bat

rem call fetch.bat https://github.com/google/protobuf/archive/v3.2.0.zip protobuf-3.2.0 protobuf-3.2.0.zip
rem cd protobuf-3.2.0/cmake

git clone -b v3.2.0 --depth 10 https://github.com/google/protobuf.git
cd protobuf/cmake

cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -Dprotobuf_MSVC_STATIC_RUNTIME=OFF -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_EXAMPLES=ON -Dprotobuf_BUILD_SHARED_LIBS=OFF -Dprotobuf_WITH_ZLIB=ON
%MSBUILD%
%ER%
%MSBUILDINSTALL%
%ER%

echo Copying *d.lib files to *.lib, or CMake may not find it
copy /y %PREFIX%\lib\libprotocd.lib %PREFIX%\lib\libprotoc.lib 
copy /y %PREFIX%\lib\libprotobufd.lib %PREFIX%\lib\libprotobuf.lib 
copy /y %PREFIX%\lib\libprotobuf-lited.lib %PREFIX%\lib\libprotobuf-lite.lib

ctest -VV 1>tests.log 2>&1
cd ../..
