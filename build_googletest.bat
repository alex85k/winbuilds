setlocal
call settings.bat

git clone --depth 10 https://github.com/google/googletest

cd googletest

mkdir build
cd build

%CMAKE% .. -DBUILD_GTEST=ON -DBUILD_GMOCK=ON
%ER%
%MAKEC%
%ER%
%MAKEC% install
%ER%

cd ../..
