@echo off
setlocal

set filePath=%1
set outputFile="%filePath%_output.exe"
for %%F in ("%filePath%") do (
    set "filename=%%~nF"  
    @REM Get the filename without extension
)
for %%F in ("%filePath%") do set "extension=%%~xF"
shift
set "args="
REM Check if there are remaining arguments
if "%1"=="" (
@REM 
) else (
    :loop
    if not "%1"=="" (
        set "args=%args% %1"  
        shift  
        goto loop
    )
)

if not "%1"=="" (
    echo Arguments: %args%
)

@REM Run file based on its extension
if /i "%extension%"==".exe" (
    echo Running executable
    "%filePath%" %args%
) else if /i "%extension%"==".bat" (
    echo Running batch file
    call "%filePath%" %args%
) else if /i "%extension%"==".cpp" (
    echo Language: C++
    g++ "%filePath%" -o %outputFile% %args% && %outputFile%
) else if /i "%extension%"==".c" (
    echo Language: C
    gcc "%filePath%" -o %outputFile% %args% && %outputFile%
@REM ) else if /i "%extension%"==".java" (
@REM     echo Language: Java
@REM     javac "%filePath%" %args%
@REM     java "%filePath%" %args% && %fileName%
) else if /i "%extension%"==".py" (
    echo Language: Python
    python "%filePath%" %args%
) else if /i "%extension%"==".js" (
    echo Language: JavaScript
    node "%filePath%" %args%
) else if /i "%extension%"==".go" (
    echo Language: GO
    go run "%filePath%" %args%
) else (
    echo "Unsupported file extension."
    exit /b
)

if exist %outputFile% (
@REM timeout /t 2 /nobreak
    del %outputFile%
)
