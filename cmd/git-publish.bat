@echo off
setlocal

if not "%2" == "" (
	goto usage
)
if not "%1" == "" (
	set UPSTREAM=%1
) else (
	set UPSTREAM=origin
)

for /f "usebackq tokens=*" %%f in (`git.exe rev-parse --abbrev-ref HEAD`) do set CUR_BRANCH=%%f
git.exe push -u %UPSTREAM% %CUR_BRANCH%

goto end

:usage
echo %~nx0 [upstream]

:end

endlocal
