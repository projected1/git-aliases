@echo off

if "%1" == "" (
    echo %~nx0 ^<email^>
    goto end
)

git.exe init
git.exe config user.email "%1"
git.exe commit --allow-empty -m "Initial commit"
git.exe checkout -b develop

:end
