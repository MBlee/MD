## CentOS8

#### Tar.gz

```shell
# Linux安装
tar -zxvf <mongodb.tgz>
mv <mongodb.tgz> /usr/local/mongodb
mkdir -p /mongodb/data/db
mkdir -p /mongodb/log
vi /mongodb/mongod.conf
# 启动
mongod|mongo -f
# 关闭
mongod --shutdown -f
use admin => db.shutdownServer()
kill -2 pid
```

```shell
# mongod.cfg
processManagement:
   fork: true
net:
   bindIp: localhost,10.8.0.10,192.168.4.24,/tmp/mongod.sock
   port: 27017
storage:
   dbPath: /var/lib/mongo
systemLog:
   destination: file
   path: "/var/log/mongodb/mongod.log"
   logAppend: true
security:
   authorization: enabled
# GUI:robo 3t
```

```shell
# mongod.cfg
dbpath=/usr/local/mongodb/db
#日志输出文件路径
logpath=/usr/local/mongodb/mongodb.log
#错误日志采用追加模式
logappend=true
#启用日志文件，默认启用
#这个选项可以过滤掉一些无用的日志信息，若需要调试使用请设置为false
quiet=true
#端口号 默认为27017
port=27017
#允许远程访问（你的服务器局域网ip）
bind_ip=0.0.0.0
#开启子进程
fork=true
#开启认证，必选先添加用户，先不开启（不用验证账号密码）
#auth=true  
```

```shell
# 可视化工具：MongodbManage,  Studio 3T
```

## Win10

```shell
# mongodb-5.0
# 启动
mongod 
    --dbpath 'dbDir'
    --logpath 'logDir'
    --install
    --serviceName 'MongoDB'
    --config|f 'mongo.cfg'
# 连接
mongo <path:port/myDb> -u -p
```

```shell
# mongodb-8.0 && mongodb-shell
- dbpath/logpath/config
- service/path
# 连接
mongosh <path:port/myDb> -u -p
```

