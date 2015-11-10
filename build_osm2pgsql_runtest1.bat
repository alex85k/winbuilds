setlocal
call settings.bat

set "PSQL_ROOT=C:\Program Files\PostgreSQL\9.4"
set PGUSER=postgres
set PGPASSWORD=Password12!

if not exist temp (
mkdir temp
cacls temp /T /E /G Users:F
cacls temp /T /E /G "Network Service":F
cacls temp /T /E /G postgres:F
"%PSQL_ROOT%\bin\psql" -c "CREATE TABLESPACE tablespacetest LOCATION '%CD:\=/%/temp'"
)

set "PATH=%CD%\osm2pgsql-bin;C:\Python27;%PATH%"

cd osm2pgsql1\build

echo "Running tests - see build_osm2pgsql_cpp_testing.log..."
rem %CD%;%PREFIX%\bin;C:\Program Files\PostgreSQL\9.3;%PATH%
ctest -VV -C %Variant% -LE FlatNodes >..\..\build_osm2pgsql_testing1.log 2>&1
rem ctest -VV -L NoDB >..\..\build_osm2pgsql_testing.log 2>&1
rem ctest -VV -R xml >..\..\build_osm2pgsql_testing.log 2>&1
%ER%
echo "Tests passed"

cd ..\..
