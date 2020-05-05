@echo off

if "%1" == "" (
	echo Target branch name is missing and it's not optional.
	goto usage
)
if not "%2" == "" (	
	goto usage
)

git.exe branch -d --remotes origin/%1
git.exe push origin -d %1
git.exe branch -D %1
git.exe fetch origin --prune

goto end

:usage
echo %~nx0 ^<target_branch_name^>

:end
