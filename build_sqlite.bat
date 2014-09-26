setlocal
call settings.bat
                                  
if "%COMPILER%" == "MINGW" (
  call fetch.bat http://www.sqlite.org/2014/sqlite-autoconf-3080600.tar.gz sqlite-autoconf-3080600
  cd sqlite-autoconf-3080600
  SET "PATH=%MSYSDIR%;%PREFIX%\bin;%PATH%"
  set "PKG_CONFIG_PATH=/d/libsmgw/lib/pkgconfig"
  if NOT EXIST Makefile (bash -c "./configure %CONFARGS%")
  %ER%
  bash -c "make install"
  %ER%

) else (
  git clone https://github.com/alex85k/sqlite3-cmake.git sqlite
  cd sqlite

  %CMAKE%
  %ER%
  %MAKEC% install
  %ER%
)

cd ..
