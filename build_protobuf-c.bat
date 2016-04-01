setlocal
call settings.bat

git clone -b master https://github.com/protobuf-c/protobuf-c.git

cd protobuf-c/build-cmake

%CMAKE%
%ER%
%MAKEC% clean
%MAKEC% install
%ER%

if "%Variant%" == "Debug" (
    ctest -VV
    %ER%
)
echo =========== OK %0 ==============
cd ..
cd ..
