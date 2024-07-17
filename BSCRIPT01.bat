@echo off
rem Open five websites
start "" "http://www.google.com"
start "" "http://www.github.com"
start "" "http://www.stackoverflow.com"
start "" "http://www.microsoft.com"
start "" "http://www.reddit.com"

rem Launch calculator and notepad
start calc.exe
start notepad.exe 

rem Initiate system shutdown after a brief delay
timeout /t 60
shutdown /s /t 0

exit