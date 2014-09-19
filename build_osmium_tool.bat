call settings.bat

git clone https://github.com/osmcode/osmium-tool
cd osmium-tool

mkdir build
cd build

cmake .. -G "Visual Studio 12 Win64" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -T CTP_Nov2013
%ER%
msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo osmium.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
%ER%
msbuild /p:Configuration=%Variant% /clp:Verbosity=minimal /nologo INSTALL.vcxproj
%ER%

cd ..\..
