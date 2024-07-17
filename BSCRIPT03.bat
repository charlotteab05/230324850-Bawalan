@echo off

rem Prompt the user to select a command
echo Please select a command:
echo 1. ipconfig
echo 2. tasklist/taskkill
echo 3. chkdsk
echo 4. format
echo 5. defrag
echo 6. find
echo 7. attrib
set /p choice= "Enter your choice from 1-7: "

if %choice% == 1 goto ipconfig_command
if %choice% == 2 goto tasklist_taskkill_command
if %choice% == 3 goto chkdsk_command
if %choice% == 4 goto format_command
if %choice% == 5 goto defrag_command
if %choice% == 6 goto find_command
if %choice% == 7 goto attrib_command

rem ipconfig command
:ipconfig_command
echo Enter the interface name (e.g., Ethernet):
set /p interface = "Enter interface name: "
ipconfig /release %interface%
ipconfig /renew %interface%
pause

rem tasklist/taskkill command
:tasklist_taskkill_command
echo Enter the process name or ID:
set /p process="Enter process name or ID: "
tasklist | findstr "%process%"
taskkill /im "%process%"
pause

rem chkdsk command
:chkdsk_command
echo Enter the drive letter (e.g., C):
set /p drive="Enter drive letter: "
chkdsk %drive%
pause

rem format command
:format_command
echo Enter the drive letter (e.g., C):
set /p drive="Enter drive letter: "
format %drive%
pause

rem defrag command
:defrag_command
echo Enter the drive letter (e.g., C):
set /p drive="Enter drive letter: "
defrag %drive%
pause

rem find command
:find_command
echo Enter the search pattern:
set /p pattern="Enter search pattern: "
find "%pattern%" > output.txt
type output.txt
pause

rem attrib command
:attrib_command
echo Enter the file path:
set /p file="Enter file path: "
attrib "%file%"
pause

rem Error handling mechanism (basic)
:error_handler
echo An error occurred.
pause > nul & exit /b 1
