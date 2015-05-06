setlocal
call settings.bat

rem git clone -b master https://github.com/protobuf-c/protobuf-c.git
git clone -b master https://github.com/alex85k/protobuf-c.git

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
