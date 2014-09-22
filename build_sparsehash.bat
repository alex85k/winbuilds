setlocal
call settings.bat

call fetch.bat http://sparsehash.googlecode.com/files/sparsehash-2.0.2.zip sparsehash-2.0.2

cd sparsehash-2.0.2

xcopy /d /y /e src\google %PREFIX%\include\google\
xcopy /d /y /e src\sparsehash %PREFIX%\include\sparsehash\
xcopy /d /y /e src\windows\google %PREFIX%\include\google\
xcopy /d /y /e src\windows\sparsehash %PREFIX%\include\sparsehash\
cd ..
