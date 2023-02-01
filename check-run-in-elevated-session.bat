@echo off
ECHO "Custom settings..."
ECHO.
SET ISADMIN=0

ECHO Detecting permissions...
ECHO.
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% == 0 (
    SET ISADMIN=1
    ECHO Administrative permissions confirmed.
) ELSE (
    ECHO Restrictive permissions detected.
)
ECHO.
