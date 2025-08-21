```shell
# vitals
- 安装配置/环境变量
- 用户管理
- 网络/防火墙/集群
- 磁盘/文件管理/vim
- 进程/服务
- 软件管理
```

## Shell

#### ^网络

```shell
# 查看网络 (^route)
ifconfig <ens33> <ip> netmask <netmask>
ifconfig <ens33> down|up
hostname -i
hostnamectl
netstat -a  #所有连接信息
netstat -i  #网卡信息
netstat -r  #路由信息
netstat -ap |grep sogou  #某个服务对应连接
netstat -nu  #UDP连接
netstat -apu  #UDP连接端口信息
# 测试网络
ping -c
traceroute
```

```shell
# 修改网络
```

#### ^防火墙

#### ^集群

#### ^用户管理

#### ^磁盘/文件管理

#### ^进程/服务

#### ^软件

#### ^安装配置

#### 网络

```sh
# DNS配置
vim /etc/resolv.conf
nameserver 8.8.8.8
nameserver 114.114.114.114
# HostName
vi /etc/hostname => /etc/hosts
hostnamectl set-hostname => systemctl restart network
```

```shell
# 查看IP
ifconfig
ping innet
ping 8.8.8.8
ping baidu.com
# 添加IP
ip addr show eth0
ip addr add 10.0.0.8/24 dev eth0
```

```shell
# 虚拟机配置
虚拟机：虚拟网络编辑器> NAT设置，子网
Window：VMnet8>IPv4> ip地址，子网
# IP配置
vi /etc/sysconfig/network-scripts/ifcfg-ens33
BOOTPROTO=static
ONBOOT=yes
IPADDR=1
NETMASK=1
GATEWAY=1
DNS1=8.8.8.8|114.114.114.114
```

```shell
# 下载
wget -O <filename> <url>
```

#### 防火墙

```shell
#! firewalld
# 端口管理
firewall-cmd --list-all
firewall-cmd --list-ports
firewall-cmd --permanent --zone=public  
firewall-cmd --add-port=443/tcp 
firewall-cmd --reload
```

#### **用户管理**

```shell
# 当前用户
whoami
# 查看
/etc/passwd => /etc/shadow => /etc/group
# 切换用户
su -<user>
sudo =>sudoers
# 退回原用户
ctrl+d
exit|logout
# 添加用户|修改
useradd|usermod <user>
- g|G <group,...>
- m|d <home/dir>
- s <bash>
- l <new> <old> (login)
# 删除用户
userdel -r <user> (remove)
-f (force)
-g (group)
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

#### **磁盘**

```shell
# 系统磁盘
df -h
# 目录
du -a
du -S
du -sm /*
# 挂载磁盘
mount <path1> <path2>
unmount -f
```

#### **进程**

```shell
ps -aux|grep [mysql]
ps -ef|grep [mysql]
pstree -pu
kill -9|-15 [pid]
```

#### **服务**

```sh
systemctl status firewalld
systemctl start
systemctl stop
systemctl enable
systemctl disable
```

>防火墙：firewall-cmd | firewall-config
>
>/etc/firewalld/ => /usr/lib/firewalld/

```shell
# 查看防火墙状态
firewall-cmd --state
# 重启防火墙
firewall-cmd --reload
# 查看开放端口
firewall-cmd --zone=public --list-ports
# 查看所有被占用端口
netstat -nlp
# 开放22端口
firewall-cmd --zone=public --add-port=22/tcp --permanent
```

#### **目录**

```shell
# 查看目录
ls -a
ls -l
ls -al
# 当前目录
pwd
# 创建目录
mkdir -p
# 删除目录
rmdir -p 
# 移除文件或目录
rm -f
rm -r
rm -i
# 复制文件或目录
cp -r 
cp -p
cp -a
# 移动文件或目录,重命名
mv -v
mv -f || -u
mv -i || -n
```

#### **文件|软件**

```shell
# 查看文件属性
l=>链接文件
d=>目录
-=>文件
rwx=>421=>7|6|5|4
# 修改组
chgrp -R <grp> <file>
# 修改主
chown -R <own:group> <file>
# 修改文件属性
chmod -R 744 <file>
# 查看内容
nano
cat|tac|nl
head|tail -n <number>
more|less=>
q # 退出
:f # 行号
# 查找内容
/ ? n N
# 创建链接
ln -s <source> <dest>
# 创建文件
touch ?file
echo ?str >> ?file
# <<和>>
cat >>
<< EOF
# 创建文件
cat > ?filePath <<EOF
EOF
echo ?str > ?file
```

```shell
# 搜索
find [path] [**] 
find -size +5M | grep [xx]
find -user
# locate
updatedb => locate
# 过滤文本
cat x.txt|grep [text] -in
grep -Ev '#|^$' default.conf
# grep|egrep|fgrep
grep -ni <files>
-v
```

> 压缩|解压缩

```shell
# gzip|gunzip =>.gz
gzip <file>
gunzip <file.gz>
# zip|unzip =>.zip
zip <new.zip> <path...>
unzip <new.zip> -d <path>
# tar => .tar.gz
tar -zcvf <.tar.gz> ...
tar -ztvf <.tar.gz>
tar -zxvf <.tar.gz> -C <dir>
```

> 安装

```shell
# rpm
rpm -qa
rpm -ql <nginx>
rpm -ivh
rpm -e --nodeps --force
```

```shell
# yum源:centos+epel
- developer.aliyun.com/mirror(阿里云镜像)
# 安装卸载
yum list installed
yum install
yum remove -y
```

```shell
# 环境变量
/etc/profile
/etc/bashrc
/etc/environment
/home/user/.bashrc
~/.profile
~/.bashrc
# 更新
source|. /etc/profile
# 添加
export PATH=$PATH:/bin
- vim ~/.bashrc
- vim /etc/bashrc|profile
  export PATH=$PATH:/bin
```

#### Vim

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

#### **开关机**

```shell
sync # 同步
# 关机
shutdown -h now 
shutdown -h 10|+10
shutdown -h 20:30
poweroff
halt
# 重启
shutdown -r now 
reboot
```

#### 文件管理

```shell
# 查看
ls -la
ll
cat
# 创建
mkdir -p
touch
# 删除
rmdir -p
rm -rfv
```

#### 测试命令

```shell
# 查看
date|cal
df #磁盘使用情况
free #系统空闲内存
```

```shell
history -c && !num #历史命令
alias alias-name='cli' #别名
unalias alias-name
```

```shell
<|> # (重定向|管道)
`` # 命令置换
```

## 常用软件

windTerm

registry.npmmirror.com/binary.html?path=node/

## 软件安装

#### 源码编译

#### YUM

```shell
# 1.YUM源
- 阿里云
- 官网
# 2.配置源
# 3.安装源
```

```shell
# 查看源
```

#### RPM
