setlocal

git clone https://github.com/alex85k/pyosmium.git pyosmium
git clone --depth 10 https://github.com/osmcode/libosmium.git

cd pyosmium

SET LIBS_PREFIX=c:/libs
SET BOOST_PREFIX=c:/libs
python setup.py build
python setup.py install --user

set PATH=%BOOST_PREFIX:/=\%\lib;%PATH%
echo %PATH%
cd test
python run_tests.py
cd ../..
