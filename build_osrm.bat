setlocal
call settings.bat

set TBB_INSTALL_DIR=%PREFIX%\tbb
set TBB_ARCH_PLATFORM=intel64/vc14
 
git clone -b develop https://github.com/Project-OSRM/osrm-backend osrm-backend
 
cd osrm-backend
 
mkdir build
cd build
 
SET PREFIX1=%PREFIX:\=/%
rem cmake .. -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON
rem use for debug:

cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.58;1.59
msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln

if  "%Variant%" == "Debug"  (
   copy /y Debug\*.pdb .
   copy /y Debug\*.exe .
) else (
   copy /y Release\*.exe .
)

cd ..
