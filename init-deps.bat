@echo off

for /f "tokens=2 delims==" %%i in ('wmic os get osarchitecture /value') do set arch=%%i
set arch=%arch:~0,2%
if %arch%==64 (
    set _7ZIP_DIR=./7zip/x64/7za.exe
) else (
    set _7ZIP_DIR=./7zip/x86/7za.exe
)
"%_7ZIP_DIR%" x -y "./_Compilers/_Compilers.7z" -o"./_Compilers/"
"%_7ZIP_DIR%" x -y "./_Libs/_Libs.7z" -o"./_Libs/"
"%_7ZIP_DIR%" x -y "./_WDK/_WDK.7z" -o"./_WDK/"