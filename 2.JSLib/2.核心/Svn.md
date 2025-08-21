### SVN服务配置管理


~~~shell
# 创建库
svnadmin  create  repository
# 监管库
svnserve -d  -r  repository
svn://localhost/访问库
# 自启动
sc create SVNService 
binpath="svnserve.exe -service -r  resposity"
start= auto
sc delete SVNService
net start SVNService
net stop SVNService

# 同步服务器
SET SVN=path
SET DIR=path
SVN update %DIR%
~~~

扩展程序BAE：
百度开放云
添加部署
复制SVN
### 三大指令
1. 检出(checkout)（版本库浏览器→svn://localhost→检出）
2. 提交(commit)（SVN提交）
3. 更新(update)

版本回退（更新版本）
版本冲突（同时修改同一文件）

1. 更新到本地
2. 整合

### 权限控制（svnserve.conf）
passwd
authz：授权

1. [groups]
admin = admin
users = user
2. [shop:/]
@admin = rw
@users = r
* = r
  ———————————————————

  服务端：http://subversion.apache.org/download.cgi
  https://www.visualsvn.com/downloads/
  https://www.visualsvn.com/server/download/
  客户端：https://www.visualsvn.com/visualsvn/download/tortoisesvn/
