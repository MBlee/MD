#### MongoDB

```shell
# 数据库操作
show dbs
use xxx
db.dropDatabase()
# 集合操作
show collections
db.xx.drop()
# 查询
db.xx.find().sort({age:1|-1}).limit().skip().count()
db.xx.find({
  $gte|$lte|$ne:<number>,
  $regex://,
  field:/^$/,
  $in:[],
  $or|$and|$not
},{_id:0,field:1|0})
# 增删改
db.xx.insertOne|Many(<Obj>|[Obj...])
db.xx.remove(<$match>,{justOne:true})
db.coll.updateOne|Many(<$match>,
	{$set,$currentDate},
	{multi:true}
)
db.coll.replaceOne()
# 索引
- db.xx.getIndexes()
- db.xx.ensureIndex({xx:1|-1,...},{unique:true}...)
- db.xx.dropIndex(INDEX-NAME|{xx:1})|
- db.xx.dropIndexes()
# 查询时间.
- db.xx.find().explain('executionStats')=>
explain.executionStats.executionTimeMillis
```

```shell
# 聚合管道
-db.xx.aggregate([],{opts})
# 管道符
$match:{xx:{$gte:90}} =>查找
$project:{xx:1...} =>展示项
$unwind:'$field0'
$skip|$limit|$sort
$group =>新组 $sum:"$xx"
$lookup:{
	from:"xx",
	localField:"xx",
	foreignField:'xx',
	as:"items"
}
```

```shell
# 超管权限
- show users
- use admin
- db.createUser{
	user,
	pwd,
	roles:[
		{role,db}
	]
}#root|dbOwner
- db.dropUser()
- db.updateUser('',{pwd:})
# 登录
- mongo admin -u x -p x
- mongo xx|db.auth()
- mongodb://admin:pwd@localhost:port/
# 配置权限
1. mongod.cfg => security => authorization:enabled
2. services.msc
```

```shell
# 集群
# 1.启动
mongod -f <mongod.conf...>

# 2.配置
mongo --port 28017
> rs.initiate()
> rs.add(<'HOSTNAME:28018'>) ...
> rs.initiate({
  _id:'rs',
  members:[{
    _id:0,
    host:'localhost:28018'
  }...]
})

# 3.验证
> db.xx.insert()
> rs.slaveOk()
> db.xx.find()
```

```shell
# mongod.conf (Window：反斜杠，无fork)
systemLog:
	destination:file
	path:/data/db1/mongod.log
	logAppend:true
storage:
	dbpath:/data/db1
net:
	bindIp:0.0.0.0
	port:28017
replication:
	replSetName:rs0
processManagement:
	fork:true
```

> npm：mongodb

```js
const { MongoClient } = require("mongodb");
const uri = "<connection string uri>";
// 创建客户端
const client = new MongoClient(uri);
// 连接数据库
client.connect((err)=>{})
// 数据库
const database = client.db('sample_mflix');
const col = database.collection('movies');
// 查询
await col.find({query});
await col.findOne({query});
// 插入
await col.insertOne({data})
await col.insertMany([{data}])
// 更改
await col.updateOne({query},{$set:{data}});
await col.updateMany({query},{$set:{data}});
await col.replaceOne();
// 删除
await col.deleteOne({query})
await col.deleteMany({query})
// 批量
await col.bulkWrite([<operation>...],{ordered})
// 关闭
client.close();
```

> NPM:  mongoose

```js
const mongoose = require('mongoose')
mongoose.connect('mongodb://user:pwd@localhost:port/database')
// 定义Schema
mongoose.Schema({name:String,age:{type,default}})
// 定义model
mongoose.model('Coll',schema,'coll')
// 查询
Coll.find({},(err,doc)=>...)
// 修改
Coll.updateOne({query},{new},(err,res)=>...)
// 删除
Coll.deleteOne({query},(err,res)=>...)
// 插入
const col = new Coll({})
col.save(err=>...)
```

PostgreSQL

Oracle

DB2