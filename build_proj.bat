setlocal
call settings.bat

call fetch.bat http://download.osgeo.org/proj/proj-4.9.1.tar.gz proj-4.9.1
cd proj-4.9.1
set INSTDIR=%PREFIX:\=\\%
if "%compiler%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PATH%"
  if NOT EXIST Makefile (bash -c "./configure %CONFARGS%")
  %ER%
  bash -c "make install"
  %ER%
) else (
  cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DPROJ_INCLUDE_SUBDIR=include -DPROJ_LIB_SUBDIR=lib -DBUILD_LIBPROJ_SHARED=YES
  %ER%
  %MSBUILDINSTALL%
  %ER%
  copy /y %PREFIX%\lib\proj_4_9.lib %PREFIX%\lib\proj_i.lib 
  cmake %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DPROJ_INCLUDE_SUBDIR=include -DPROJ_LIB_SUBDIR=lib -DBUILD_LIBPROJ_SHARED=NO
  %ER%
  %MSBUILDINSTALL%
  %ER%
  copy /y %PREFIX%\lib\proj_4_9.lib %PREFIX%\lib\proj.lib 
)

cd ..
