@echo off
cls
tasm.exe %1.asm
if ERRORLEVEL 1 echo [FATAL]: ASSEMBLY ERROR
if ERRORLEVEL 1 goto end
tlink.exe /x %1.obj
if ERRORLEVEL 1 echo [FATAL]: LINK ERROR
if ERRORLEVEL 1 goto end
%1.exe
echo.
if ERRORLEVEL 1 echo [RUNTIME]: PROGRAM EXITED WITH ERROOR CODE %ERRORLEVEL%
if ERRORLEVEL 1 goto end
:end
