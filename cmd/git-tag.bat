@echo off

git.exe for-each-ref --format="%%(color:bold yellow)%%(refname:short)%%(color:reset) %%(color:red)%%(taggerdate) %%(color:reset)%%(subject)" refs/tags
