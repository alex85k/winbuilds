setlocal
call settings.bat

git clone https://github.com/systemed/tilemaker.git
rem git clone https://github.com/alex85k/tilemaker.git

cd tilemaker
mkdir build
cd build
cmake .. %GENERATOR% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX1% -DBOOST_ROOT=%BOOST_ROOT% -DBoost_USE_STATIC_LIBS=ON -DBoost_ADDITIONAL_VERSIONS=1.58;1.59
%ER%
%MSBUILDINSTALL%
%ER%

cd ..
mkdir dist
copy build\%VARIANT%\*.exe dist
copy resources\*.rb dist
copy *.json dist
copy *.lua dist
copy %PREFIX%\bin\lua.dll dist

echo FOR %%%%G IN (*.osm.pbf) DO tilemaker %%%%G --output tiles/  > dist\convert.bat
echo FOR %%%%G IN (*.osm.pbf) DO tilemaker %%%%G --output tiles.mbtiles  > dist\convert_mbtiles.bat
"%SEDC%" -i dist/config.json -e "s@\"minzoom\":[^,]*,@\"minzoom\": 1,@"
"%SEDC%" -i dist/config.json -e "s@\"gzip\"@\"none\"@"

cd ..\..

