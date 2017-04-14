setlocal
call settings.bat

call fetch.bat http://prdownloads.sourceforge.net/libpng/lpng1629.zip lpng1629

cd lpng1629
%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..
