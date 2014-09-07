call settings.bat 

git svn clone -r HEAD http://googletest.googlecode.com/svn/trunk/ gtest

cd gtest
cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -Dgtest_force_shared_crt=ON
%MAKE%

xcopy /d /y /e include\gtest %PREFIX%\include\gtest\
copy /y *.lib %PREFIX%\lib\

cd ..
