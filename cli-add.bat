@echo off
setlocal
set filePath=%1
for %%F in ("%filePath%") do (
    set "filename=%%~nF"  
    set "extension=%%~xF"
)
move "%filePath%" "C:\CODING\code\utils\command-line-tools\run\%filename%%extension%"

@REM alias %filename% "%filePath%"