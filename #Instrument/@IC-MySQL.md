## CentOS8

```shell
# 卸载Mariadb
yum list installed | grep mariadb
yum -y remove mariadb
```

```shell
# 连接
mysql -uroot -p
```

```shell
# 随机密码: /var/log/mysqld.log => root
# 忽略密码
whereis my.cnf
vi /etc/my.cnf
skip-grant-tables

# 修改密码: validate_password
ALTER  USER  'root'@'localhost'  IDENTIFIED BY 'mike.8080';
set global validate_password.policy = 0;
set global validate_password.length = 4;
# 修改密码
select user,host,authentication_string from mysql.user
update mysql.user set authentication_string=password('123') where user='root'
flush privileges
exit

# 创建用户
create user 'mike'@'%' IDENTIFIED BY 'mike8080';# mysql 8.0 以下
create user 'mike'@'%' IDENTIFIED WITH mysql_native_password BY 'mike8080';# mysql 8.0
# 权限分配
grant all on *.* to 'mike'@'%';
```

#### RPM

~~~shell
# 下载地址: MySQL Community => Download Archives => MySQL Community Server
# Linux安装
1. 安装插件
  yum install openssl-devel
  yum -y install libaio perl net-tools
2. 安装Mysql
  rpm -ivh mysql-community-common
  rpm -ivh mysql-community-client-plugins
  rpm -ivh mysql-community-libs
  rpm -ivh mysql-community-libs-compat
  rpm -ivh mysql-community-devel
  rpm -ivh mysql-community-client
  rpm -ivh mysql-community-server
~~~

```shell
# Linux卸载
1. 卸载Mysql
  rpm -qa | grep -i mysql
  rpm -e
2. 删除数据目录
  rm -rf /var/lib/mysql/
3. 删除配置文件备份
  rm -rf /etc/my.cnf.rpmsave
```

#### Tar.gz

```shell
# 初始化
./mysqld
	-initialize 
	-user=mysql
	-datadir=/opt/mysql/data
	-basedir=/opt/mysql
# 加密
./mysql_ssl_rsa_setup
	-datadir=/opt/mysql/data
# 权限
chown -R mysql:mysql /opt/mysql/
chmod -R 777 /opt/mysql/
# 开启
mysqld_safe &
# 关闭
kill -9 <pid>
mysqladmin -uroot -p --shutdown
```

## Win10

```shell
#!Win10（MySQL8 + Workbench）
# 软件-数据
# 服务-环境
```

```shell
#!Win10 (XAMPP)
# XAMPP套件安装
# 开启
mysqld
# 连接
mysql 
-h127.0.0.1 -P3306
-uroot -p -D
```

## 图形化工具

```shell
#! 可视化工具：Navicat，SQLYog，dbeaver
# Navicat17
# Debug(密码错误)
USE mysql;
AlTER USER 'root'@'loacalhost' IDENTIFIED WITH mysql_native_password BY 'pwd' #修改密码规则和密码
FLUSH PRIVILEGES; #刷新权限

# SQLYog
# dbeaver
```

