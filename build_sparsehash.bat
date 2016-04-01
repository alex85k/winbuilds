setlocal
call settings.bat

call fetch.bat https://github.com/sparsehash/sparsehash/archive/sparsehash-2.0.3.zip sparsehash-sparsehash-2.0.3
cd sparsehash-sparsehash-2.0.3

xcopy /d /y /e src\google %PREFIX%\include\google\
xcopy /d /y /e src\sparsehash %PREFIX%\include\sparsehash\
xcopy /d /y /e src\windows\google %PREFIX%\include\google\
xcopy /d /y /e src\windows\sparsehash %PREFIX%\include\sparsehash\
cd ..
