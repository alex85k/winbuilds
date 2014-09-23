setlocal
call settings.bat

call fetch.bat "https://googletest.googlecode.com/files/gtest-1.7.0.zip" gtest-1.7.0 gtest-1.7.0.zip
rem git svn clone -r HEAD http://googletest.googlecode.com/svn/trunk/ gtest

cd gtest-1.7.0

%CMAKE% -Dgtest_force_shared_crt=ON
%ER%
%MAKEC%
%ER%

xcopy /d /y /e include\gtest %PREFIX%\include\gtest\
copy /y *.lib %PREFIX%\lib\

cd ..
