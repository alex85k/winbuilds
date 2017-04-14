setlocal
call settings.bat

git clone -b next https://github.com/protobuf-c/protobuf-c.git
rem git clone -b next https://github.com/alex85k/protobuf-c.git

cd protobuf-c/build-cmake

%CMAKE%
%ER%
%MAKEC% clean
%MAKEC% VERBOSE=1 install
%ER%

if "%Variant%" == "Debug" (
    ctest -VV
    %ER%
)
echo =========== OK %0 ==============
cd ..
cd ..
