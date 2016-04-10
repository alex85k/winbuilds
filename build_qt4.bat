setlocal
call settings.bat

call fetch.bat http://files.linux-addicted.net/qtproject/official_releases/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.zip qt-everywhere-opensource-src-4.8.7 >nul

call fetch.bat https://fami.codefreak.ru/mirrors/qt/unofficial_builds/qt4.8.7-msvc2015/02-fix_build_with_msvc2015-45e8f4ee.diff .
copy 02-fix_build_with_msvc2015-45e8f4ee.diff qt-everywhere-opensource-src-4.8.7

cd qt-everywhere-opensource-src-4.8.7
git init

git apply 02-fix_build_with_msvc2015-45e8f4ee.diff

set PATH=%PREFIX%\bin;%PATH%

if NOT EXIST configure.cache (
  echo y | configure -debug-and-release -opensource -shared -no-qt3support -nomake demos -nomake examples -prefix %PREFIX%/qt4
  %ER%
) else (
  echo "File configure.cache already exists, not running configure"
)

rem nmake
jom -j2
%ER%

nmake install
%ER%

cd ..
