setlocal
call settings.bat

rem git clone https://github.com/Oberon00/luabind.git
git clone https://github.com/DennisOSRM/luabind

cd luabind

cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
%ER%
%MSBUILDINSTALL%
%ER%

cd ..

