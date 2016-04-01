setlocal
call settings.bat

git clone https://github.com/Oberon00/luabind.git
rem git clone https://github.com/DennisOSRM/luabind

cd luabind

cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.58;1.59;1.60
%ER%
%MSBUILDINSTALL%
%ER%

cd ..

