#!/bin/bash

git log --graph --format="%Cgreen%h%C(bold yellow)%d%Creset %<(15,trunc)%Cblue%an %<(25)%Cred%ai %Creset%s" --abbrev-commit --branches $@
