@echo off

git.exe log --graph --format="%%Cgreen%%h%%C(bold yellow)%%d%%Creset %%<(15,trunc)%%C(cyan)%%an %%<(25)%%Cred%%ai %%Creset%%s" --abbrev-commit --branches %*
