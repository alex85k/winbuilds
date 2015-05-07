setlocal
call settings.bat

git clone https://github.com/bagder/curl
cd curl

cmake %GENERATOR% -DGEOS_ENABLE_TESTS=OFF -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1%
%ER%
%MSBUILDINSTALL%
%ER%

del %PREFIX%\bin\curl.exe

cd ..
