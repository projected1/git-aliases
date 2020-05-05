@rem Lists files in a specific commmit.
@echo off

if "%1" == "" (
	echo %~nx0 ^<commit_hash^>
    goto end
)

if not "%2" == "" (
	echo %~nx0 ^<commit_hash^>
    goto end
)

git.exe --no-pager diff-tree --no-commit-id --name-only -r %*

:end
