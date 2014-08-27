set "PATH2=%PATH%"
set "PATH=%PATH2%;C:\Program Files (x86)\Git\bin"
set D=%1


if "%3" == "" (
for /f "delims=" %%a in ('basename %D%') do (
  set FN=%%a
)
) else (
  set FN=%3
)

if NOT EXIST %FN% (
  echo curl %D% -o "%FN%"
  curl -L %D% -o "%FN%"
) else (
  echo "File already exists, no download is needed"
)

if NOT EXIST %2 (
  tar xvfz %FN%
  7z x %FN%
)
set "PATH=%PATH2%"
