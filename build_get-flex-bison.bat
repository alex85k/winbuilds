setlocal
call settings.bat

call fetch.bat http://sourceforge.net/projects/winflexbison/files/win_flex_bison-latest.zip .
echo Unpacking binaries... 
7z x win_flex_bison-latest.zip data win_flex.exe win_bison.exe 
echo Moving binaries to %PREFIX%\bin 
move win_flex.exe %PREFIX%\bin
move win_bison.exe %PREFIX%\bin
move data %PREFIX%\bin


cd ..
