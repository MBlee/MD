## 版本更新

```shell
git init
git add/remove
git commit -am
```

```shell
#清除缓存
git restore --staged file
git reset HEAD file

#检查缓存
git ls-files
git status
git diff HEAD -- file
```

## 版本回退

```shell
#查找
git log/reflog --pretty=oneline 
#回退
git reset --hard HEAD^~/id
```

## 远程仓库

~~~shell
#建立连接
git remote add origin @git
#推送
git push -u origin master
~~~

## 分支

~~~shell
git pull
git fetch
git checkout -b local remote
git merge bra
git branch -d/-m bra
git push origin :remote
~~~

## 标签

~~~shell
git tag -a -m
git tag -d
git push origin --tags
~~~

