setlocal
call settings.bat

git clone https://github.com/berkus/dir_monitor.git
cd dir_monitor

%CMAKE% -DBUILD_TESTING=ON -DBOOST_TEST_STATIC_LINK=ON -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.58;1.59;1.60
%ER%
nmake
%ER%

ctest
cd ..

