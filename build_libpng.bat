setlocal
call settings.bat

call fetch.bat http://prdownloads.sourceforge.net/libpng/lpng1632.zip lpng1632

cd lpng1632
%CMAKE%
%ER%
%MAKEC% install
%ER%

cd ..
