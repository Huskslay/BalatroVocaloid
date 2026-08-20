@echo off

:: Get version
for /f "delims=" %%v in ('python creation/pack/read_version.py "metadata.json"') do set version=%%v
echo Packing version: %version%
echo.

:: Pack
call creation/pack/pack.bat %version%

pause