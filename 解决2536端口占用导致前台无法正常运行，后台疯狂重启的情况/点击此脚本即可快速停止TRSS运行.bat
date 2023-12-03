@echo off
setlocal

REM 检测指定端口的占用情况
netstat -ano | findstr ":2536"

REM 如果端口占用，则结束相应的进程
if %errorlevel%==0 (
    for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":2536"') do (
        taskkill /F /PID %%a
    )
)

endlocal
