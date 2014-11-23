call settings.bat

set PATH=C:\Program Files (x86)\Git\bin;%PATH%
bash -c "bash ./build_osrm_create_devpack.sh"
cd osrm_libs

xcopy /y /e ..\..\ruby ruby\

..\7z a ../libs_osrm_%Variant%.7z libs boost_min tbb *.bat -t7z -mx=9
..\7z a ../libs_osrm_%Variant%_test.7z libs boost_min tbb ruby *.bat -t7z -mx=9