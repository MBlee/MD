## 高级命令

#### 编程命令

```shell
# 循环
for /r %a in (,); do cmd
```

```shell
# 变量
%~nI 文件名
%~xI 扩展名
```

## 网站加速

~~~shell
# IP查询
https://ipaddress.com/website/github.com
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

```shell
# hosts文件（https://www.ipaddress.com/）
- C:\Windows\System32\drivers\etc\hosts
10.0.0.8	a.xx.cn xx.cn
151.101.1.194	github.global.ssl.fastly.net
140.82.113.3	github.com
```

## 注册表

> regedit

#### 添加右键

```markdown
# 文件：HKEY_CLASSES_ROOT\*\shell
1. 新建项：sublime => 默认
2. 新建字符串：Icon: <path/program.exe>
3. 新建子项：command: <path/program.exe> "%1"
# 目录：HKEY_CLASSES_ROOT\Directory\Background?\shell
1. 新建项：cmd
2. 新建子项：command:  <path/program.exe> "%1"
3. 新建字符串：Icon:  <path/program.exe>
```

## 文件操作

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
# 删除文件|文件夹
rd /s/q  <_dir>
del /s/q/f   <_file>
# 复制文件|文件夹
copy xx xx /s/h
xcopy xx xx /s/h
# 移动文件
move xx xx
for %a in(,) do move
# 文件保存退出
esc :wq
~~~

```shell
# 合并文件
copy /b a+b... c
```

~~~shell
# 查看文件夹名称
dir /b
# 查看文件夹大小
dir _files /a /s
# 查找
find /c /i
~~~

~~~shell
# 当前位置
pwd
# Cd位置
cd ~ /
# 文件列表
ls|dir|gci
# 显示隐藏文件
dir /a /h /s /b
# 彻底隐藏
Attrib +a +h +s +r <file>
Attrib -a -h -s -r <file>
~~~

~~~shell
# 管理员权限
Start-Process powershell -Verb runAs 
~~~

## 用户管理

~~~shell
# 查询用户
net user
# 增加用户
net user /add xx
# 删除用户
net user /delete xx
~~~

## 服务管理

~~~shell
services.msc
# 开启|关闭
net start
net stop
~~~

## 进程管理

~~~shell
# 查看进程
tasklist
# 关闭进程
taskkill /f /pid xxId
taskkill /f /im xx
~~~

## ......

## 常用

~~~shell
#!查看
# 查看Node位置
where node
# 查看系统配置
systeminfo
dxdiag
# 查看服务
services.msc
~~~

~~~shell
#!时间戳
# PowerShell
Get-Date -Format "yyMMddhh"
# Git
$(date +%F)
# CMD
date|time /t
~~~

## 配置

#### CMD默认管理员

~~~shell
# 修改注册表
HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers
新增字符串值：c:\windows\system32\cmd.exe
RUNASADMIN
# 导入注册表
[HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers]
"c:\\windows\\system32\\cmd.exe"="RUNASADMIN"
~~~

#### CMD起别名

```shell
# 设置环境变量
@echo off
pnpm %*
# 注册表自动执行：Command Processor
# C:\AutoCmd\auto.bat
@echo off
doskey pm=pnpm  $*
```

#### PowerShell执行脚本

```shell
# 重设执行策略（管理员）
set-executionpolicy remotesigned
# 查看现在的执行策略
get-executionpolicy
```

#### PowerShell起别名

```shell
# 查找默认配置
echo $profile
# 设置别名：
# C:\Users\my\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
set-alias -name pn -value pnpm
```

