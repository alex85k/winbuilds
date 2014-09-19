call settings.bat

rem git clone https://github.com/DennisOSRM/stxxl.git
git clone https://github.com/stxxl/stxxl.git

cd stxxl
mkdir build
cd build

%CMAKE% ..
%ER%
%MAKE% install
%ER%

cd ..
cd ..