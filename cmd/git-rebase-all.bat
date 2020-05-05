@echo off

if "%1" == "" (
    echo %~nx0 ^<target_branch_name^>
	goto end
)

for /f "usebackq tokens=*" %%f in (`git.exe branch --format "%%(refname:short)"`) do (
    if not "%1" == "%%f" (
        git.exe checkout %%f
        if %errorlevel% neq 0 (
            echo Error checking-out %%f
            pause
        )

        git.exe rebase %1
        if %errorlevel% neq 0 (
            echo Error rebasing %%f onto %1
            pause
        )
    )
)

:end
