@echo off

if "%1" == "" (
    echo %~nx0 ^<search string^> [file pattern]
    goto end
)

rem %1 = Search string
rem %2 = pathspec. e.g. *.xml
rem -n = Line numbers
rem -i = Ignore case
rem -E = Extended regexp
git.exe show-ref --heads | cut -d" " -f2 | xargs git grep -n -i -E "%1" -- "%2"

:end
