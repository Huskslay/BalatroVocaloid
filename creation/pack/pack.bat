@echo off
setlocal enabledelayedexpansion

echo Checking arguments
if "%~1"=="" (
   echo No version argument provided
   exit /b 1
)
set "version=%~1"
if "%~2"=="" (
   echo No exclusion argument provided
   exit /b 1
)
set "exclude_items=%~2"

:: Get current folder name
for %%* in (.) do set "foldername=%%~n*"

:: Define names for temporary file list and target folder
set "filelist=temp_filelist.txt"
set "targetfolder=%foldername%"
set "zipfile=%foldername%-v%version%.zip"

:: Clean up previous
if exist "%filelist%" del "%filelist%"
if exist "%zipfile%" del "%zipfile%"
if exist "%targetfolder%" rd /s /q "%targetfolder%"

echo Creating target folder "%targetfolder%"...
mkdir "%targetfolder%"

echo Filtering and copying files and folders...

:: Loop through all items in current directory
for /f "delims=" %%i in ('dir /b /a') do (
    set "skip=false"

    :: Skip the temporary file list, zip file, and target folder itself
    if /i "%%i"=="%filelist%" set "skip=true"
    if /i "%%i"=="%zipfile%" set "skip=true"
    if /i "%%i"=="%targetfolder%" set "skip=true"

    :: Check if item is in exclude list
    for %%e in (%exclude_items%) do (
        if /i "%%i"=="%%e" set "skip=true"
    )

    if !skip! == false (
        echo Copying: %%i
        :: Check if item is a directory or file and copy accordingly
        if exist "%%i\" (
            :: It's a directory
            xcopy "%%i" "%targetfolder%\%%i" /e /i /h /k /y >nul
        ) else (
            :: It's a file
            copy /y "%%i" "%targetfolder%\" >nul
        )
    ) else (
        echo Skipping: %%i
    )
)

echo.
echo Creating zip archive "%zipfile%" from "%targetfolder%"...

powershell -command "Compress-Archive -Path '%targetfolder%' -DestinationPath '%zipfile%' -Force"

echo.
echo Completed: %zipfile%
echo.

:: Delete folder
rd /s /q "%targetfolder%"
