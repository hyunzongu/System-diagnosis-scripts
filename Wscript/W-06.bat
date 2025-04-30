REM W-06 관리자 그룹에 최소한의 사용자 포함
@echo off
chcp 65001

set RESULT=W-06.txt

echo [W-06] 관리자 그룹에 최소한의 사용자 포함  >> %RESULT%
echo [점검 현황]    >> %RESULT%
echo.


echo ## 로컬 그룹 정보 조회 ##  >> %RESULT%
net localgroup administrators | findstr /I /V "admin --- command comment"  >> %RESULT%
echo.


echo [점검 기준] >> %RESULT%
echo [양호] 관리자 그룹에 최소한의 사용자 포함  >> %RESULT%
echo [취약] 관리자 그룹에 불필요한 사용자 포함  >> %RESULT%
echo.

echo [점검결과]    >> %RESULT%
echo [인터뷰] 운영자/담당자와의 인터뷰를 통해 불필요한 계정 확인 >> %RESULT%

pause