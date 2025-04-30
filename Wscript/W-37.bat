:: -------------------------------------------------------------------------------

:: W-37 SAM 파일 접근 통제 설정 여부 점검

:: -------------------------------------------------------------------------------

echo ------------------------------------------------------------------------------- >> %HNAME%.%DATE%.txt

echo          W-37 SAM 파일 접근 통제 설정 여부 점검	    >> %HNAME%.%DATE%.txt

echo ------------------------------------------------------------------------------- >> %HNAME%.%DATE%.txt

echo [점검 현황]    >> %HNAME%.%DATE%.txt

echo.

echo ## SAM 파일 접근 통제 설정 여부 점검 ## 	>> %HNAME%.%DATE%.txt

icacls c:\windows\system32\config\SAM | findstr /V /I "administrator system success" > W-37.txt

fsutil file createnew test.txt 0

echo n | comp test.txt W-37.txt

echo [점검 기준]		>> %HNAME%.%DATE%.txt

echo [양호]	SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 설정되어 있는 경우	>> %HNAME%.%DATE%.txt

echo [취약]	SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한이 설정되어 있는 경우	>> %HNAME%.%DATE%.txt

IF NOT ERRORLEVEL 1 (
	echo [취약] 시스템의 보안 설정이 변경되었음.	 >> %HNAME%.%DATE%.txt
) ELSE (
	REM [양호] 시스템의 보안 설정이 변경되지 않았음.	 >> %HNAME%.%DATE%.txt
	type  W-37.txt | find /I ":" >nul
	IF NOT ERRORLEVEL 1 (
		echo [취약] SAM 파일 접근권한에 Administrator, System 그룹 외 다른 그룹에 권한이 설정되어있음.	>> %HNAME%.%DATE%.txt
	) ELSE (
	echo [양호] SAM 파일 접근권한에 Administrator, System 그룹만 모든 권한으로 설정되어있음.		>> %HNAME%.%DATE%.txt
	)
)
pause