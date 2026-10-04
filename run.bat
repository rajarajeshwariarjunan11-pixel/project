@echo off
title MetroVerify Server Launcher
echo ========================================================
echo   Launching MetroVerify Online Verification System...
echo ========================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Opening directly in browser...
    start "" "%~dp0index.html"
)
pause
