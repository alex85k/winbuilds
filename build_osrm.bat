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
   cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
   msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln
   copy /y Debug\*.pdb .
   copy /y Debug\*.exe .
) else (
   cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
   msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln
   copy /y Release\*.exe .
)

cd ..
