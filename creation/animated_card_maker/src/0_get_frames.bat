@echo off
setlocal enabledelayedexpansion

echo Checking argument
if "%~1"=="" (
   echo No argument provided
   exit /b 1
)
set "mediaLocation=%~1"

echo Creating output folder
set "folderName=frames"
if not exist "%folderName%" mkdir "%folderName%"

echo Emptying folder
del /q "%folderName%\*.*" >nul 2>&1

echo.
echo.
echo Extract frames...
ffmpeg -i "%mediaLocation%" -vf scale=142:190 -q:v 2 "%folderName%\%%04d.png"

if %errorlevel% equ 0 (
   echo Extraction success!
) else (
   echo An error occurred during extraction.
)