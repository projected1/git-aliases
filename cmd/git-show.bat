@rem Shows file contents from a specific commit.
@rem Fixes Git-Windows slash issue - transforms all backslashes to slashes.
@echo off
setlocal

if "%1" == "" (
	echo %~nx0 ^<commit_hash^>:^<path_to_file^>
    goto end
)

rem Replace backslashes with slashes
set "INPUT=%1"
set "SLASH_FIX=%INPUT:\=/%"

rem -U0 = 0 context lines (only show the changes)
git.exe --no-pager show %SLASH_FIX% -U0 --ignore-all-space --ignore-blank-lines

:end

endlocal
