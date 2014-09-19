call settings.bat

git clone -b develop https://github.com/philsquared/Catch.git
cd Catch\Projects\CMake

%CMAKE% 
%ER%
%MAKE%
%ER%
ctest -VV
%ER%

cd ..\..\..

