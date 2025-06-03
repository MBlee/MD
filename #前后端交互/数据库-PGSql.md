## Essential

#### 登录

```shell
psql -U <user> -d <db> -h <host> -p 5432
\q #退出
```

#### 数据库操作

```sql
-- 切换数据库
\c <db>
-- 查看所有数据库
\l
```

```sql
-- 查看表结构
\d <tbl>
-- 自增
SERIAL
-- 表目录
CREATE SCHEMA <schema>
```

#### Schema

#### 备份

#### 用户操作

#### 控制台命令

## CentOS安装

```shell
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql17-server
sudo /usr/pgsql-17/bin/postgresql-17-setup initdb
sudo systemctl enable postgresql-17
sudo systemctl start postgresql-17
```

```shell
# 修改Postgre密码
su postgre
psql
ALTER USER postgres WITH PASSWORD 'NewPwd';
# 配置远程访问
sudu firewall-cmd --add-port=5432/tcp --permanent
sudu firewall-cmd --reload
vi /var/lib/pgsql/17/data/postgresql.conf
listen_addresses=*
vi /var/lib/pgsql/17/data/pg_hba.conf
host all all 0.0.0.0/0 md5
```

## Window安装

#### 远程访问设置

```shell
# data/pg_hba
IPV4 >> host all all 0.0.0.0/0 md5
```

