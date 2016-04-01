setlocal
call settings.bat

call fetch.bat http://prdownloads.sourceforge.net/libpng/lpng1621.zip lpng1621

cd lpng1621
%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..
