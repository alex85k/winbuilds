setlocal
call settings.bat

git clone https://github.com/postgres/postgres.git

cd postgres

if "%compiler%" == "MINGW" (
  SET "PATH=%MSYSDIR%;%PATH%"
  if NOT EXIST config.status (bash -c "./configure %CONFARGS%")
  %ER%
  bash -c "make install -j2"
  %ER%
  bash -c "make check"
  %ER%
) else (
  echo "Building PostgreSQL on MSVC is not yet supported, please install binary distribution"
)
)
