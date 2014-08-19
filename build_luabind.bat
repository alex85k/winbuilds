call settings.bat

rem git clone https://github.com/Oberon00/luabind.git
git clone https://github.com/DennisOSRM/luabind

cd luabind
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DBUILD_TESTING=NO -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DCMAKE_INSTALL_PREFIX=%PREFIX%
nmake install
cd ..