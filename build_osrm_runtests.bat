setlocal
call settings.bat

SET PATH=%PREFIX%\bin;D:\tbb\bin\intel64\vc12;%PATH%

cd osrm-backend
echo disk=d:\temp\stxxl,1000,wincall > test\stxxl.txt
SET STXXLCFG=stxxl.txt
mkdir d:\temp

cucumber
cd ..
