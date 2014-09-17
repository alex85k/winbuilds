call settings.bat

git clone https://github.com/coapp-packages/expat.git
cd expat

"%SED%" -i lib/expat_external.h -e "s@defined(XML_STATIC)@1@"

cmake -G %CMAKE_TARGET% -DCMAKE_BUILD_TYPE=%VARIANT% -DCMAKE_INSTALL_PREFIX=%PREFIX% -DBUILD_shared=OFF
%MAKE% install
cd ..
