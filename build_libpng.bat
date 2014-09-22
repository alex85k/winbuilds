setlocal
call settings.bat

call fetch.bat http://prdownloads.sourceforge.net/libpng/lpng1612.zip lpng1612

cd lpng1612
%CMAKE%
%ER%
%MAKE% install
%ER%

cd ..
