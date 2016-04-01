setlocal
call settings.bat

call fetch.bat http://download.osgeo.org/proj/proj-4.9.2.tar.gz proj-4.9.2
cd proj-4.9.2
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
  copy /y %PREFIX%\lib\proj_4_9_d.lib %PREFIX%\lib\proj.lib
)

cd ..
