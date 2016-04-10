setlocal
call settings.bat

call fetch.bat http://download.qt.io/official_releases/jom/jom.zip .
7z x jom.zip -o%PREFIX%/bin

cd ..
