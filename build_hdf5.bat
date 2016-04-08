setlocal
call settings.bat
call fetch.bat http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.16.zip hdf5-1.8.16

cd hdf5-1.8.16

mkdir build
cd build
cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBUILD_TESTS=ON
%ER%
%MSBUILDINSTALL%
%ER%

cd ..
