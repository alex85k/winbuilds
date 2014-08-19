
set "PATH=%PATH%;C:\Program Files (x86)\Git\bin"
set D="%1"

for /f "delims=" %%a in ('basename %D%') do (
  set FN=%%a
)


if NOT EXIST %FN% (
  curl %D% -o %FN% 
) else (
  echo "File already exists, no download is needed"
)

if NOT EXIST %2 (
if NOT "%3" == "" (
  tar xvfz %FN% -C %3
  7z x %FN -o %3
) else (
  tar xvfz %FN%
  7z x %FN%
)
)