@echo off



:: Define excluded items
set "exclude_items=pack.bat;.git;.gitattributes;.gitignore;creation;.luarc.json"



:: Get version
for /f "delims=" %%v in ('python creation/pack/read_version.py "metadata.json"') do set version=%%v
echo Packing version: %version%
echo.

:: Pack
call creation/pack/pack.bat %version% %exclude_items%

pause