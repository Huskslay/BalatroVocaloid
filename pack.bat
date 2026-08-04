@echo off
setlocal enabledelayedexpansion

for %%* in (.) do set "foldername=%%~n*"

set "exclude_items=pack.bat;.gitattributes;.gitignore;.luarc.json"

set "zipfile=%foldername%.zip"

set "filelist=temp_filelist.txt"

if exist "%filelist%" del "%filelist%"
if exist "%zipfile%" del "%zipfile%"

echo Filtering...

for /f "delims=" %%i in ('dir /b /a') do (
   set "skip=false"
   
   if /i "%%i"=="%filelist%" set "skip=true"
   if /i "%%i"=="%zipfile%" set "skip=true"
   
   for %%e in (%exclude_items%) do (
      if /i "%%i"=="%%e" set "skip=true"
   )
   
   if !skip! == false (
      echo Adding: %%i
      echo %%i>>"%filelist%"
   ) else (
      echo Skipping: %%i
   )
)

if not exist "%filelist%" (
   echo Nothing to zip.
   pause
   exit /b
)

echo Zipping...

powershell -command "$items = Get-Content '%filelist%'; Compress-Archive -Path $items -DestinationPath '%zipfile%' -Force"

if exist "%filelist%" del "%filelist%"

echo.
echo Completed: %zipfile%
pause
