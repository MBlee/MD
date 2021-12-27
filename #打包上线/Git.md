## Git本地

#### 1.更新提交

~~~shell
# git init
git add/remove
git commit -am
# 一键还原
git checkout -- xxxfile（未缓存）
git reset HEAD xxxfile（已缓存）
~~~

~~~shell
# 查询git库状态
git status
# 查询修改内容
git diff HEAD -- xxxfile
# 查询版本ID
git log/reflog --pretty=oneline --graph  --all|3
~~~

#### 2.版本回退

~~~shell
git checkout id -- xxxfile|.
git reset --hard HEAD^~/id
~~~

#### #分支

~~~shell
git pull
git fetch
# 创建
git branch xxxbra
git checkout xxxbra
git checkout -b xxxbra
# 删除|找回
git branch -d|-D xxxbra
git branch xxxbra xxxid
# 批量删除分支
git branch --merged
git branch --nomerged
# 合并分支
git checkout xxxbra
git merge xxxbra
# 快转机制
git merge xxxbra --no-ff
git merge xxxbra --no-ff --no-commit
git merge xxxbra --squash --no-commit
git commit
# 合并冲突
git merge --abort
git commit(手动合并)


git checkout -b local remote
git merge bra
git branch -d/-m bra
git push origin :remote
~~~

#### #标签

~~~shell
git tag -a -m
git tag -d
git push origin --tags
~~~

#### #基本配置

~~~shell
# 1. 配置账户
git config --global user.name|user.email xxx
git config --list
# 2. 配置SSH登录
$ssh-keygen -t rsa -C "1850214353@qq.com"
# 3. 克隆
git clone xxx@git
# 忽略配置.gitignore
/node_modules
*.txt
*.zip
# 恢复初始化
rm -rf .git
~~~

## GitHub

~~~shell
# 主仓库做为服务器
新建仓库：xxx.github.io
setting 
# SSH下载
ssh-keygen -t rsa -C "1850214353@qq.com"
ssh -T git@github.com

# 清除仓库
git remote remove origin

##已有项目
# 建立连接
git remote add origin @git
# 推送
git push -u origin master
# 获取远程项目
git clone xxxUrl xxxNewname --no-checkout --bare
# 拉取项目
git pull
git fetch + git merge
# 删除远端分支|仓库迁移
~~~
