call settings.bat

call fetch.bat https://github.com/01org/tbb/archive/2017_U5.zip tbb-2017_U5
rem https://www.threadingbuildingblocks.org/sites/default/files/software_releases/source/tbb44_20150728oss_src.tgz tbb44_20150728oss


if "%COMPILER%" == "MINGW" (
cd tbb-2017_U5
  SET "PATH=%MSYSDIR%;%PATH%"
  bash -c "make mingw"  
  %ER%
  cd ..
) else (
cd tbb-2017_U5\build\vs2012
devenv  makefile.sln /Upgrade /nologo
rem msbuild /p:Configuration=Debug /clp:Verbosity=minimal /nologo makefile.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
msbuild /p:Configuration=Release /clp:Verbosity=minimal /nologo makefile.sln /flp1:logfile=build_errors.txt;errorsonly /flp2:logfile=build_warnings.txt;warningsonly
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
copy /y x64\Debug\*.lib %PREFIX%\tbb\lib\intel64\vc14
copy /y x64\Debug\*.dll %PREFIX%\tbb\bin\intel64\vc14
copy /y x64\Release\*.lib %PREFIX%\tbb\lib\intel64\vc14
copy /y x64\Release\*.dll %PREFIX%\tbb\bin\intel64\vc14
xcopy /d /y /e ..\..\include %PREFIX%\tbb\include

cd ..\..\..
)
