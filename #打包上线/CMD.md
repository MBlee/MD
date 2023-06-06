### 常用查看

~~~shell
# 查看Node位置
where node
# 查看系统配置
systeminfo
dxdiag
~~~

#### 时间戳

~~~shell
# PowerShell
Get-Date -Format "yyMMddhh"
# Git
$(date +%F)
# CMD
date|time /t
~~~

### 网站加速

~~~shell
# IP查询
https://ipaddress.com/website/github.com
# hosts文件
C:\Windows\System32\drivers\etc
# 清理缓存
ipconfig/flushdns
# 查询网站网速
ping xx
# 查询跳转路由
tracert xxIp
# 查询路由表
route print
# 查询共享文件
net share
# 创建共享
net share xx=xx
~~~

### 文件操作

~~~shell
# 创建文件夹
mkdir xxx/xxxDir
# 创建文件
touch xxx/xxx.txt
type nul>xx.txt
echo xx>xx.txt #查看 type xx.txt
fsutil file createnew #文件名  #文件大小
# 删除文件夹
rd /s /q xxxDir #PS: rd -recurse
rm -rf xxx/xxxDir
# 删除文件
del /S /F /Q xxxDir
# 复制文件
copy xx xx
# 复制文件夹
xcopy xx xx /s /h
# 移动文件
move xx xx
# 文件保存退出
esc :wq
~~~

~~~shell
# 查看文件夹大小
dir _files /a /s
~~~

~~~shell
# 当前位置
pwd
# Cd位置
cd ~ /
# 文件列表
ls|dir|gci
# 显示隐藏文件
dir /a:b /s /b
~~~

~~~shell
# 管理员权限
Start-Process powershell -Verb runAs 
~~~

### 管理

#### 用户管理

~~~shell
# 查询用户
net user
# 增加用户
net user /add xx
# 删除用户
net user /delete xx
~~~

#### 服务管理

~~~shell
net start
net stop xx
~~~

#### 进程管理

~~~shell
# 查看进程
tasklist
# 关闭进程
taskkill /f /pid xxId
taskkill /f /im xx
~~~

