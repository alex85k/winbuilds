set DIR0=%CD%
echo Building %1, see %~n1.log
call %1 >%~n1.log 2>&1
if errorlevel 1 (
  start notepad %DIR0%\%~n1.log
  set "ERRORS=%ERRORS% %1"
  CD %DIR0%
  exit /b 1
) else (
  CD %DIR0%
)