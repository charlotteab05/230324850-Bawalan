@echo off

rem Sorting text files by date...
dir /s /b /od /tc C:\*.txt > sorted_files.txt

REM Archive older files to a folder on Drive Z:
echo Archiving older files to a folder on Drive Z:...
robocopy C:\ Z:\Archive /s /maxage:30 /mov

REM Sort the archived files by size
echo Sorting the archived files by size...
cd /d Z:\Archive
dir /b /os > sorted_files.txt

rem  Prompting user for permission to delete old, large files...
for /f "tokens=" %%A in (sorted_archived_files.txt) do (
    echo %%i
    set /p delete=Do you want to delete %%A? (Y/N):
    if errorlevel 2(
        echo No chosen
    ) else (
        if errorlevel 1(
            echo Yes chosen
            del "%%i"
        )
    )
) else (
    echo No files found for deletion
)

pause