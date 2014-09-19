call settings.bat

git clone https://github.com/coapp-packages/expat.git
cd expat

"%SED%" -i lib/expat_external.h -e "s@defined(XML_STATIC)@1@"

%CMAKE% -DBUILD_shared=OFF
%ER%
%MAKE% install
%ER%

cd ..
