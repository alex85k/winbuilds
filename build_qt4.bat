setlocal
call settings.bat

call fetch.bat http://files.linux-addicted.net/qtproject/official_releases/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.zip qt-everywhere-opensource-src-4.8.7

copy 02-fix_build_with_msvc2015-45e8f4ee.diff qt-everywhere-opensource-src-4.8.7

cd qt-everywhere-opensource-src-4.8.7
git init

git apply 02-fix_build_with_msvc2015-45e8f4ee.diff

del bin\syncqt.bat
del bin\syncqt


echo o y | configure -debug-and-release -shared -no-qt3support -prefix %PREFIX%
%ER%

nmake
%ER%

nmake install
%ER%

cd ..
