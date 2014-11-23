setlocal
call settings.bat

set TBB_INSTALL_DIR=d:/tbb
set TBB_ARCH_PLATFORM=intel64/vc12
 
git clone -b develop https://github.com/Project-OSRM/osrm-backend osrm-backend
 
cd osrm-backend
 
mkdir build
cd build
 
SET PREFIX1=%PREFIX:\=/%
rem cmake .. -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
rem use for debug:

if  "%Variant%" == "Debug"  (
  cmake .. -G "Visual Studio 12 Win64" -DCMAKE_CXX_FLAGS=/showIncludes -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.57 -T CTP_Nov2013
  msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln
  copy /y Debug\*.pdb .
  copy /y Debug\*.exe .
) else (
  cmake .. -G "Visual Studio 12 Win64" -DCMAKE_CXX_FLAGS=/showIncludes -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.57 -T CTP_Nov2013
  msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln
  copy /y Release\*.exe .
)

cd ..
