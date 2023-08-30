#### Linux命令

> **开关机**

```shell
sync # 同步
# 关机
shutdown -h now 
shutdown -h 10|+10
shutdown -h 20:30
halt
poweroff
# 重启
shutdown -r now 
reboot
```

> **目录**

```shell
# 查看目录
ls -a
ls -l
ls -al
# 当前目录
pwd
# 创建目录
mkdir
mkdir -p
# 删除目录
rmdir 
rmdir -p 
# 移除文件或目录
rm -f
rm -r
rm -i
# 复制文件或目录
cp -r
cp -a
# 移动文件或目录,重命名
mv -f
mv -u
```

> **文件**

```shell
# 查看文件属性
l=>链接文件
d=>目录
-=>文件
rwx=>421=>7|6|5|4
# 修改文件属性
chmod -R 744 <file>
# 修改组
chgrp -R <grp> <file>
# 修改主
chown -R <grp:own> <file>
# 查看内容
cat|tac|nl
head|tail -n <number>
more|less=>
q # 退出
:f # 行号
# 查找内容
/ ? n N
# 创建链接
ln -s <a> <b>
# 创建文件
touch <file>
echo <str> >><file>
```

> **vim**

```shell
# 输入模式
i|a|o|r
# 底线命令=> ESC :
q!|q|wq
set nu
set nonu
```

> **vim快捷键**

```shell
# 移动1页
ctrl + f
ctrl + b
# 移动一行
+
-
n <enter>
# 移动字数
n <space>
0
$
H
M
L
# 移动至首尾
gg
nG
G
```

```shell
# 搜索替换
/word
?word
n
N
```

```shell
# 删除字
x|X
<n>x
dd
<n>dd
d1G
dG
d$
d0
# 复制行
yy
<n>yy
y1G
yG
y0
y$
p|P
# 撤销
u
# 重做
ctrl + r
# 查找
:/keyword => n
# 显示行号
:set nu|set nonu
```

> **管理员**

```shell
# 当前用户
whoami
# 切换管理员
su
```

> **用户管理**

```shell
# 查看
/etc/passwd => /etc/shadow => /etc/group
# 切换用户
su -<user>
sudo su root
# 退回原用户
ctrl+d
exit|loginout
# 添加用户|修改
useradd|usermod <user>
- g|G <group>
- m|d <home/dir>
- s <bash>
- l <new> <old>
# 删除用户
userdel -r <user>
# 设置密码
passwd <user>
-l
-d
# 添加组
groupadd|groupmod -g <ID> <group>
-n <new> <old>
# 删除组
groupdel <GID>
```

#### Linux常用命令

~~~shell
# 查看IP
ifconfig
~~~

#### Linux简介

**版本：**Ubuntu、RedHat、CentOS

**特点：**[安全性]()、[稳定性]()、[高并发]()

> 安装：虚拟机 > 创建虚拟机 > 镜像

**目录结构：**[/](/)：根目录

- [bin | usr/bin]()：系统可执行文件（任何目录）

  [usr/local/bin](usr/local/bin)：用户可执行文件

- [etc]()：系统配置文件，配置环境变量（etc/profile）

  [home]()：用户根目录

  [root]()：管理员根目录

  [opt]()：存档额外安装的软件

  [usr]()：应用程序和文件

  [tmp]()：临时文件，安装包

  [var]()：经常被修改的目录

  [www]()：存放服务器网站相关