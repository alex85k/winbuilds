call settings.bat 

rem git clone https://github.com/DennisOSRM/stxxl.git
git clone https://github.com/stxxl/stxxl.git
cd stxxl
mkdir build
cd build
cmake .. -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% 
rem for older MSVC than VS 2013
rem cmake .. -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
nmake install
cd ..
cd ..