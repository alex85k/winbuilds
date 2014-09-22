setlocal
call settings.bat

rem git clone https://github.com/Oberon00/luabind.git
git clone https://github.com/DennisOSRM/luabind

cd luabind

%CMAKE% -DBUILD_TESTING=NO -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
%ER%
%MAKE% install
%ER%

cd ..

