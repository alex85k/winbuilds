SET COMPILER=MSVC2015
SET PREFIX=c:/libs
SET BOOST_ROOT=c:/libs
SET Variant=Release

call build_zlib.bat
call build_bzip.bat
call build_expat.bat
call build_boost_py.bat
echo Creating archive...
7z a -t7z -mx=9 pyosmium_libs_%Variant%.7z %PREFIX% >NUL
echo OK

