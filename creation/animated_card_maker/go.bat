@echo off
setlocal enabledelayedexpansion

cd src

echo Getting Data...
set /p mediaLocation=Video/GIF file: 
set "mediaLocation=..\\%mediaLocation%"
set /p wantBorder=Do you want a border? (y/n): 
set /p skipCount=Enter skip count: 

echo.
echo.
echo Getting Frames...
call 0_get_frames.bat "%mediaLocation%"

if /i "%wantBorder%"=="y" (
    echo.
    echo.
    echo Adding border...
    call python 1_add_border.py "%skipCount%"
    echo.
    echo.
    echo Putting into grid...
    call python 2_put_in_grid.py "border_frames" "0"
) else (
    echo.
    echo.
    echo Putting into grid...
    call python 2_put_in_grid.py "frames" "%skipCount%"
)

echo.
echo.
echo Done!
pause