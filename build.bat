@echo off

for /f "usebackq tokens=*" %%i in (`vswhere -nologo -latest -property installationPath`) do (
    set "vspath=%%i"
)

set _MSBUILD_PATH=%vspath%\Common7\Tools\VsDevCmd.bat

"%_MSBUILD_PATH%" && msbuild ./LocaleEmulatorSolution.sln /t:Rebuild /p:Configuration=Release /p:Platform="x86"^
 && echo "Build successful!"^
 && xcopy /Y "LoaderDll\Release\*.dll" ".\Build\" & xcopy /Y "LocaleEmulator\Release\*.dll" ".\Build\"^
 && pause