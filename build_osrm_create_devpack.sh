CD=`pwd`
osrm_libs=$CD/osrm_libs/libs

# SPECIFY TBB folder
TBB=$CD/../tbb

rm -rf $osrm_libs
mkdir -p $osrm_libs
awk '/Note: including file:.*boost/{tgt=$4; sub("d:\\\\boost\\\\","",tgt); gsub("\\\\","/",tgt); print ("cp --parents "tgt " '$CD'/osrm_libs/boost_min")}' build_osrm.log >batch.sh
cat batch.sh | sort | uniq > $BOOST_ROOT/batch.sh

mkdir -p osrm_libs/boost_min
mkdir -p osrm_libs/boost_min/lib
mkdir -p osrm_libs/boost_min/include

cd $BOOST_ROOT
echo "Copying needed Boost headers to osrm_libs/boost_min..."
./batch.sh

cp -r --parents include/boost-1_57/boost/thread $CD/osrm_libs/boost_min
cp -r --parents include/boost-1_57/boost/detail $CD/osrm_libs/boost_min
cp -r --parents include/boost-1_57/boost/uuid $CD/osrm_libs/boost_min
cp -r --parents include/boost-1_57/boost/exception $CD/osrm_libs/boost_min
cp -r --parents include/boost-1_57/boost/smart_ptr $CD/osrm_libs/boost_min
cp -r --parents include/boost-1_57/boost/test $CD/osrm_libs/boost_min
cp -r include/boost-1_57/boost/*.hpp $CD/osrm_libs/boost_min/include/boost-1_57/boost
echo "Copying Boost libs to osrm_libs/boost_min..."
boost_libs="date_time chrono filesystem system unit_test_framework thread iostreams program_options regex zlib"
if [ $VARIANT == "Debug" ]; then
  dflag="gd-"
else
  dflag=""
fi

for lib in $boost_libs ; do
  cp lib/libboost_$lib-vc120-mt-${dflag}1* $CD/osrm_libs/boost_min/lib
done;

echo "Copying other header and libs to osrm_libs/libs..."
cd $CD

mkdir -p osrm_libs/tbb
mkdir -p osrm_libs/tbb/include
mkdir -p osrm_libs/tbb/lib

mkdir -p $osrm_libs/include
mkdir -p $osrm_libs/lib
mkdir -p $osrm_libs/bin

cp -r $PREFIX/bin/lua.dll $osrm_libs/bin
cp -r $PREFIX/bin/protoc.exe $osrm_libs/bin
cp -r $PREFIX/include/google $osrm_libs/include
cp -r $PREFIX/include/osmpbf $osrm_libs/include
cp -r $PREFIX/include/stxxl $osrm_libs/include
cp -r $PREFIX/include/luabind $osrm_libs/include
cp -r $PREFIX/include/bzlib.h* $osrm_libs/include
cp -r $PREFIX/include/expat* $osrm_libs/include
cp -r $PREFIX/include/lua* $osrm_libs/include
cp -r $PREFIX/include/laux* $osrm_libs/include
cp -r $PREFIX/include/zconf.h $osrm_libs/include
cp -r $PREFIX/include/zlib.h $osrm_libs/include
cp -r $PREFIX/include/stxxl.h $osrm_libs/include
cp -r $PREFIX/lib/expat* $osrm_libs/lib
cp -r $PREFIX/lib/lua* $osrm_libs/lib
cp -r $PREFIX/lib/osmpbf* $osrm_libs/lib
cp -r $PREFIX/lib/stxxl* $osrm_libs/lib
cp -r $PREFIX/lib/zlib* $osrm_libs/lib
cp -r $PREFIX/lib/bzip* $osrm_libs/lib
cp -r $PREFIX/lib/protobuf.* $osrm_libs/lib

if [ "$VARIANT" == "Debug" ]; then
  cp -r $TBB/bin/intel64/vc12/tbb_debug.dll $osrm_libs/bin
  cp -r $TBB/bin/intel64/vc12/tbbmalloc_debug.dll $osrm_libs/bin
  cp -r $TBB/bin/intel64/vc12/tbb_preview_debug.dll $osrm_libs/bin
  cp -r $TBB/bin/intel64/vc12/tbbmalloc_proxy_debug.dll $osrm_libs/bin
else
  cp -r $TBB/bin/intel64/vc12/tbb.dll $osrm_libs/bin
  cp -r $TBB/bin/intel64/vc12/tbbmalloc.dll $osrm_libs/bin
  cp -r $TBB/bin/intel64/vc12/tbb_preview.dll $osrm_libs/bin
  cp -r $TBB/bin/intel64/vc12/tbbmalloc_proxy.dll $osrm_libs/bin
fi 
cp -r $TBB/include osrm_libs/tbb
mkdir -p osrm_libs/tbb/lib/intel64/vc12

if [ "$VARIANT" == "Debug" ]; then
  cp -r $TBB/lib/intel64/vc12/tbb.lib osrm_libs/tbb/lib/intel64/vc12
  cp -r $TBB/lib/intel64/vc12/tbb_debug.lib osrm_libs/tbb/lib/intel64/vc12
  cp -r $TBB/lib/intel64/vc12/tbbmalloc_debug.lib osrm_libs/tbb/lib/intel64/vc12
  cp -r $TBB/lib/intel64/vc12/tbb_preview_debug.lib osrm_libs/tbb/lib/intel64/vc12
  cp -r $TBB/lib/intel64/vc12/tbbproxy_debug.lib osrm_libs/tbb/lib/intel64/vc12
else
  cp -r $TBB/lib/intel64/vc12/tbb.lib osrm_libs/tbb/lib/intel64/vc12
  cp -r $TBB/lib/intel64/vc12/tbbmalloc.lib osrm_libs/tbb/lib/intel64/vc12
  cp -r $TBB/lib/intel64/vc12/tbb_preview.lib osrm_libs/tbb/lib/intel64/vc12
  cp -r $TBB/lib/intel64/vc12/tbbproxy.lib osrm_libs/tbb/lib/intel64/vc12
fi 


script=osrm_libs/build_osrm.bat

echo "set VARIANT=$VARIANT
call \"%VS120COMNTOOLS%\..\..\VC\vcvarsall.bat\" x86_amd64
set PREFIX=%CD%/libs
set BOOST_ROOT=%CD%/boost_min
set TBB_INSTALL_DIR=%CD%/tbb
set TBB_ARCH_PLATFORM=intel64/vc12


if not exist osrm-bin (mkdir osrm-bin)
if not exist osrm-backend (git clone -b develop https://github.com/Project-OSRM/osrm-backend osrm-backend)
cd osrm-backend

mkdir build
cd build
cmake .. -G \"Visual Studio 12 Win64\" -DBoost_ADDITIONAL_VERSIONS=1.57 -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -T CTP_Nov2013
msbuild /p:Configuration=%Variant% /clp:Verbosity=normal /nologo OSRM.sln
copy /y %VARIANT%\*.pdb .
copy /y %VARIANT%\*.exe .

copy *.exe ..\..\osrm-bin
if \"%VARIANT%\"==\"Debug\" (copy *.pdb ..\..\osrm-bin)
cd ..\profiles
echo disk=c:\temp\stxxl,10000,wincall > .stxxl.txt
copy *.* ..\..\osrm-bin
copy car.lua ..\..\osrm-bin\profile.lua
xcopy /y lib ..\..\osrm-bin\lib\ 
copy %PREFIX:/=\\%\bin\*.dll ..\..\osrm-bin

cd ..\..\osrm-bin

" > $script

script=osrm_libs/runtests.bat

echo "setlocal
set PATH=%CD%\libs\bin;%CD%\ruby\bin;%CD%\osrm-backend\build;%PATH%
echo disk=%CD%\stxxl,1000,wincall > test/stxxl.txt
set OSRM_TIMEOUT=200
set STXXLCFG=stxxl.txt
cd osrm-backend 
cucumber
cd ..

" > $script

