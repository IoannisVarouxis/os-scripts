REM https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc725744(v=ws.10)


schtasks /create /sc minute /mo 20 /tn "Task1" /tr C:\scripts\script.bat

REM schtasks /Query /tn Task1 /v /fo list
