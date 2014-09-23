setlocal
call settings.bat

git clone https://github.com/coapp-packages/expat.git
cd expat

"%SEDC%" -i lib/expat_external.h -e "s@defined(XML_STATIC)@1@"

%CMAKE% -DBUILD_shared=OFF
%ER%
%MAKEC% install
%ER%

cd ..
