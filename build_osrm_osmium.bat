setlocal
call settings.bat

set TBB_INSTALL_DIR=d:/libs/tbb
set TBB_ARCH_PLATFORM=intel64/vc12
 
git clone https://github.com/Project-OSRM/osrm-backend osrm-backend-osmium
 
cd osrm-backend-osmium
git checkout feature/libosmium
 
mkdir build
cd build
 
SET PREFIX1=%PREFIX:\=/%
rem cmake .. -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
rem use for debug:

if  "%Variant%" == "Debug"  (
  cmake .. -G "Visual Studio 12 Win64" -DCMAKE_BUILD_TYPE=%VARIANT% -DSTXXL_LIBRARY=%PREFIX1%/lib/stxxl_debug.lib -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -T CTP_Nov2013
  msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln
  copy /y Debug\*.pdb .
  copy /y Debug\*.exe .
) else (
  cmake .. -G "Visual Studio 12 Win64" -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -T CTP_Nov2013
  msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln
  copy /y Release\*.exe .
)

cd ..
