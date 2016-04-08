setlocal
call settings.bat

call fetch.bat http://files.linux-addicted.net/qtproject/official_releases/qt/4.8/4.8.7/qt-everywhere-opensource-src-4.8.7.zip qt-everywhere-opensource-src-4.8.7
cd qt-everywhere-opensource-src-4.8.7


configure -debug-and-release -shared -no-qt3support -prefix %PREFIX1%
%ER%

nmake
%ER%

nmake install
%ER%

cd ..
