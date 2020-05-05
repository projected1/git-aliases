#!/bin/bash

git log --format="%Cgreen%h %<(15,trunc)%Cblue%an %<(25)%Cred%ai %Creset%s" --abbrev=8 $@
