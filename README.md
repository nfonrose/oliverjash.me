TODO: Work out the commands to set these URLs dynamically.

`.git/config`:
```
[core]
  repositoryformatversion = 0
  filemode = true
  bare = false
  logallrefupdates = true
  ignorecase = true
[remote "origin"]
  url = git@github.com:OliverJAsh/oliverjash.me.git
  fetch = +refs/heads/*:refs/remotes/origin/*
[remote "all"]
  url = git@github.com:OliverJAsh/oliverjash.me.git
  url = oliver@178.79.177.7:~/repositories/oliverjash.me.git
[remote "deploy"]
  url = oliver@178.79.177.7:~/repositories/oliverjash.me.git
  fetch = +refs/heads/*:refs/remotes/deploy/*
[branch "project"]
  remote = all
  merge = refs/heads/project
[branch "master"]
  remote = all
  merge = refs/heads/master
```
