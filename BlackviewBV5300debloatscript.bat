@echo off
title Blackview BV5300 Interactive Debloater
color 0A

:check_prereqs
cls
echo [INFO] Checking environment prerequisites...
echo ---------------------------------------------------

REM Check if ADB is installed and in the system PATH
where adb >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] ADB is not found in your system PATH or not installed!
    echo Please install Android Platform Tools and ensure adb.exe is added to your PATH environment variables.
    echo ---------------------------------------------------
    pause
    exit
)

REM Check if an Android device is connected and authorized via ADB
for /f "tokens=2" %%i in ('adb devices ^| findstr /r "\<device\>"') do (
    set "device_found=1"
)

if not defined device_found (
    echo [ERROR] No authorized Android device detected via ADB!
    echo Please make sure USB Debugging is enabled on your phone and authorized.
    echo ---------------------------------------------------
    pause
    exit
)

echo [SUCCESS] Environment check passed! ADB and device detected.
timeout /t 2 >nul

:menu
cls
echo ===================================================
echo       BLACKVIEW BV5300 INTERACTIVE DEBLOATER
echo ===================================================
echo  1. Remove ALL Standard Bloatware at Once
echo  2. Select ^& Remove Individual Apps/Features
echo  3. Change Console Color Theme
echo  4. Exit
echo ===================================================
set /p choice="Enter your choice (1-4): "

if "%choice%"=="1" goto remove_all
if "%choice%"=="2" goto custom_menu
if "%choice%"=="3" goto color_menu
if "%choice%"=="4" exit
goto menu

:remove_all
cls
echo [INFO] Removing all tracked bloatware packages...
echo ---------------------------------------------------
set packages=cn.wps.moffice_eng com.google.android.apps.tachyon com.google.android.videos com.blackview.childmode com.blackview.apkupgrade com.blackview.health com.blackview.weather com.blackview.notebook com.blackview.radioservice com.blackview.artorial.client com.blackview.qrcode com.blackview.filetrans com.blackview.smscode com.blackview.userfeedback com.blackview.easytrans com.blackview.powersavemode com.debug.loggerui com.blackview.tool com.blackview.commuservice com.blackview.bvworkspace com.blackview.systemmanager com.blackview.gamemode com.blackview.focusmode com.blackview.frozenapp com.android.wallpaper.livepicker com.android.manual com.google.android.apps.nbu.paisa.user

for %%p in (%packages%) do (
    echo Removing %%p...
    adb shell pm uninstall -k --user 0 %%p
)
echo ---------------------------------------------------
echo All automated cleanup tasks finished!
pause
goto menu

:custom_menu
cls
echo ===================================================
echo            INDIVIDUAL APP REMOVAL MENU
echo ===================================================
echo  1. WPS Office (cn.wps.moffice_eng)
echo  2. Google Meet (com.google.android.apps.tachyon)
echo  3. Google TV / Videos (com.google.android.videos)
echo  4. Blackview Child Mode (com.blackview.childmode)
echo  5. Blackview Weather (com.blackview.weather)
echo  6. Cold Room / Frozen App (com.blackview.frozenapp)
echo  7. Focus Mode (com.blackview.focusmode)
echo  8. Live Wallpaper (com.android.wallpaper.livepicker)
echo  9. User Manual (com.android.manual)
echo 10. GPay (com.google.android.apps.nbu.paisa.user)
echo 11. Back to Main Menu
echo ===================================================
set /p subchoice="Choose an app to remove (1-11): "

if "%subchoice%"=="1" (
    adb shell pm uninstall -k --user 0 cn.wps.moffice_eng
) else if "%subchoice%"=="2" (
    adb shell pm uninstall -k --user 0 com.google.android.apps.tachyon
) else if "%subchoice%"=="3" (
    adb shell pm uninstall -k --user 0 com.google.android.videos
) else if "%subchoice%"=="4" (
    adb shell pm uninstall -k --user 0 com.blackview.childmode
) else if "%subchoice%"=="5" (
    adb shell pm uninstall -k --user 0 com.blackview.weather
) else if "%subchoice%"=="6" (
    adb shell pm uninstall -k --user 0 com.blackview.frozenapp
) else if "%subchoice%"=="7" (
    adb shell pm uninstall -k --user 0 com.blackview.focusmode
) else if "%subchoice%"=="8" (
    adb shell pm uninstall -k --user 0 com.android.wallpaper.livepicker
) else if "%subchoice%"=="9" (
    adb shell pm uninstall -k --user 0 com.android.manual
) else if "%subchoice%"=="10" (
    adb shell pm uninstall -k --user 0 com.google.android.apps.nbu.paisa.user
) else if "%subchoice%"=="11" (
    goto menu
)

echo ---------------------------------------------------
echo Action completed for selected item.
pause
goto custom_menu

:color_menu
cls
echo ===================================================
echo               SELECT COLOR THEME
echo ===================================================
echo  1. Hacker Green
echo  2. Cyber Blue
echo  3. Neon Purple
echo  4. Classic White
echo  5. Back to Main Menu
echo ===================================================
set /p colchoice="Choose a color vibe (1-5): "

if "%colchoice%"=="1" (
    color 0A
) else if "%colchoice%"=="2" (
    color 0B
) else if "%colchoice%"=="3" (
    color 0D
) else if "%colchoice%"=="4" (
    color 07
) else if "%colchoice%"=="5" (
    goto menu
)
goto color_menu