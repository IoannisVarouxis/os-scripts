REM
REM The +,, is a special flag to copy telling it to simply update the date/time on the file
REM The +,, is a special flag to copy telling it to simply update the date/time on the file
REM http://technet.microsoft.com/en-us/library/bb490886.aspx
REM

@COPY /B %1+,, %1
