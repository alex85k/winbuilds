set "PATH2=%PATH%"
set "PATH=%PATH2%;C:\Program Files\Git\usr\bin"
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
 if x%FN:.tgz=% NEQ x%FN% (
  tar xvfz %FN%
 ) else (
 if x%FN:.gz=% NEQ x%FN% (
  tar xvfz %FN%
 ) else (
 if x%FN:.bz2=% NEQ x%FN% (
  tar xvfj %FN%
 ) else (
  7z x %FN%
 )
 )
)
)

set "PATH=%PATH2%"
