@echo off
chcp 65001
set RESULT=W-09.txt
echo [W-09] 불필요한 서비스 제거  > %RESULT%
echo [점검 현황]    >> %RESULT%
echo.
echo ## 불필요한 서비스 작동 조회 ##  >> %RESULT%
net start | findstr /I /V "command started" >> %RESULT%
echo.
echo [점검 기준] >> %RESULT%
echo 양호 : 일반적으로 불필요한 서비스(위 목록 참조)가 중지되어 있는 경우 >> %RESULT%
echo 취약 : 일반적으로 불필요한 서비스(위 목록 참조)가 구동 중인 경우  >> %RESULT%
echo.
echo [점검결과]    >> %RESULT%
net start | findstr /I "Alerter ClipBook Messenger" >> %RESULT%
net start | find /I "Simple TCP/IP Services"  >> %RESULT%
echo.
IF NOT ERRORLEVEL 1 (
 echo 불필요한 Alerter, ClipBook, Messenger, Simple TCP/IP Services가 존재하지 않음. >> %RESULT%
) ELSE (
 echo 불필요한 서비스가 발견되었습니다. 관리자와 상의하세요. >> %RESULT%
)
pause