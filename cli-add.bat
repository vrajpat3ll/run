@echo off
setlocal
set filePath=%1
for %%F in ("%filePath%") do (
    set "filename=%%~nF"  
    set "extension=%%~xF"
)
@REM add your custom path here
move "%filePath%" "C:\command-line-tools\%filename%%extension%"

@REM alias %filename% "%filePath%"