call settings.bat

call fetch.bat https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb44_20150728oss_src.tgz tbb44_20150728oss


if "%COMPILER%" == "MINGW" (
cd tbb43_20140724oss
  SET "PATH=%MSYSDIR%;%PATH%"
  bash -c "make mingw"  
  %ER%
  cd ..
) else (
cd tbb44_20150728oss\build\vs2010
rem devenv  makefile.sln /Upgrade /nologo
rem msbuild /p:Configuration=Debug /clp:Verbosity=minimal /nologo makefile.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
rem msbuild /p:Configuration=Release /clp:Verbosity=minimal /nologo makefile.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
echo Creating dirs
mkdir %PREFIX%\tbb
mkdir %PREFIX%\tbb\lib
mkdir %PREFIX%\tbb\bin
mkdir %PREFIX%\tbb\include
mkdir %PREFIX%\tbb\lib\intel64
mkdir %PREFIX%\tbb\bin\intel64
mkdir %PREFIX%\tbb\lib\intel64\vc14
mkdir %PREFIX%\tbb\bin\intel64\vc14

echo Copy files
copy /y intel64\Debug\*.lib %PREFIX%\tbb\lib\intel64\vc14
copy /y intel64\Debug\*.dll %PREFIX%\tbb\bin\intel64\vc14
copy /y intel64\Release\*.lib %PREFIX%\tbb\lib\intel64\vc14
copy /y intel64\Release\*.dll %PREFIX%\tbb\bin\intel64\vc14
xcopy /d /y /e ..\..\src\include %PREFIX%\tbb\include

cd ..\..\..
)
