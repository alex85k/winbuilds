call settings.bat

call fetch.bat https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb43_20140724oss_src.tgz tbb43_20140724oss


cd tbb43_20140724oss\build\vs2010
devenv  makefile.sln /Upgrade /nologo
msbuild /p:Configuration=Debug /clp:Verbosity=minimal /nologo makefile.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
msbuild /p:Configuration=Release /clp:Verbosity=minimal /nologo makefile.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly

copy /y intel64\Debug\*.lib %PREFIX%\lib
copy /y intel64\Debug\*.dll %PREFIX%\bin
copy /y intel64\Release\*.lib %PREFIX%\lib
copy /y intel64\Release\*.dll %PREFIX%\bin
xcopy /d /y /e ..\..\src\include %PREFIX%\include

cd ..\..\..

