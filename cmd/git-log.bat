@echo off

git.exe log --format="%%Cgreen%%h %%<(15,trunc)%%C(cyan)%%an %%<(25)%%Cred%%ai%%C(bold red)%%d %%Creset%%s" --abbrev=8 %*
