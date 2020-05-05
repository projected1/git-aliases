@echo off

if "%1" == "" (
	echo Target branch name is missing and it's not optional.
	goto usage
)
if "%2" == "" (
	echo Source branch name is missing and it's not optional.
	goto usage
)
if not "%4" == "" (	
	goto usage
)

git.exe checkout %1
git.exe pull
git.exe checkout %2
git.exe rebase %1
if %errorlevel% neq 0 (
	echo Resolve conflicts from another shell window before proceeding.
	pause
	git.exe rebase --continue
)
git.exe checkout %1
if "%3" == "" (
	git.exe merge --no-ff --commit -m "Merge branch '%2' into %1" %2
) else (
	git.exe merge --no-ff --commit -m "Merge branch '%2' into %1" -m "[Delivers %3]" %2
)
git.exe push
git.exe branch -d --remotes origin/%2
git.exe push origin -d %2
git.exe branch -d %2
git.exe fetch origin --prune

goto end

:usage
echo %~nx0 ^<target_branch_name^> ^<source_branch_name^> [pivotal_tracker_story_id]

:end
