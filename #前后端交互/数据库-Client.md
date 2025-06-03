## 数据库

#### IndexDB

```shell
# 特点: 1.容量大 2.异步（同源|事务）
- indexedDB||mozIndexedDB||webkitIndexedDB||msIndexedDB
```

```js
// 创建数据库(打开)
1.indexedDB.open('xx-name',version) => req
2.req.onsuccess|error = event=>event.target.result
3.req.onupgradeneeded = event=>{
  store = db.createObjectStore('xx-name',{keyPath:'xx-id',autoIncrement:true})
  store.createIndex('xx','xx',{unique:true})
  event.target.transaction.oncomplete=()=>{}
}
// 获取事务
db.transaction(['_store'],'readwrite')
.objectStore('xx-store')
// 增加
objStore.add(_data).onsuccess|onerror
// 删除
objStore.del(_id).onsuccess|onerror
// 修改
objStore.put(_data).onsuccess|onerror
// 查
ObjStore.get|getAll(id)
ObjStore.index(_index).get()
ObjStore.index(_index).openCursor(IDBKeyRange.bound(_key),'prev')
=> cursor.advance()
=> cursor.value
=> cursor.continue()
```

#### WebSQL

```js
var db = openDataBase('person',1,'person',0)
db.transaction(tx=>{
  tx.executeSql('',[],(tx,res)=>{})
  'create table if not exists student(id unique,name)'//创建表
  'insert into student(id,name) value(?,?)'// 插入数据
  'select * from student'// 查询数据
})
```

## API

#### GraphQL

```ts
// 原生
import {graphql,buildSchema} from 'graphql'
const schema = buildSchema(`
	type Query|Mutation{
		key:[String!],
		key(id:ID!):Int
	}
`)
const resolver = {
    key(){ return 'string' },
    key(args){ return 'Int' }
}
const query = '{
	Mutation xx($id:ID!){ key(xx:$id){} }
	input Params{ key... }
}'
graphql(schema,query,resolver).then(res=>...)
```

```ts
// ApolloServer
// npm: @apollo/server graphql
import {ApolloServer} from '@apollo/server'
import {startStandaloneServer} from '@apollo/server/standalone'
const typeDefs = `#graphql`
const resolvers = {Query...}
const apollo = new ApolloServer({typeDefs,resolvers})
const {url} = await startStandaloneServer(apollo,{listen:{port}})
```

```ts
// Server
import {graphqlHTTP} from 'express-graphql'
app.use('/graphql',graphqlHTTP({
    schema,resolver,
    graphql:true
}))
// ApolloServerExpress
const {ApolloServer,gql} = require('apollo-server-express')
const typeDefs = gql``
const resolvers = {
  Query:{
    
  }
  Other:{
  	(parent,args,context)=>...
  }
}
const apollo = new ApolloServer({typeDefs,resolvers,context(req)})
apollo.applyMiddleware({app})
apollo.graphqlPath
// ApolloDatasourceMongodb
>>>data-source/Users.js
import {MongoDataSource} from 'apollo-datasource-mongodb'
export default class Users extends MongoDataSource{
  getUser(userId){ return this.findOneById(userId) }
}
const apollo = new ApolloServer({typeDefs,resolvers,dataSources:()=>{
  users:new Users(client.db().collection('users')) | new Users(UserModel)
}}) => (parent,args,{dataSources})=>...
```

```ts
// Client
axios({
    method:'POST',
    url:'/graphql',
    data:{
        query:'xx($id:ID!){key}',
        variables:{id:0}
    }
})
fetch({body:{query:'{key}'}})
```

#### Mock

```shell
# mockjs产生模拟数据
cnpm i mockjs -S
# json5解决json无法添加注释问题
cnpm i json5 -S
```

<!-- 方法 -->

- **mock**
  - rurl?|rtype?
  - template|function(obj)
- **random**
  - extend({fn})
- **setup**
  - timeout, '10-100'

<!-- VUE配置 -->

```js
// devServer
if(process.env.MOCK == 'true')
- require(mock/index.js)
- before: function(app, server, compiler){
   app.get('/some/path', function(req, res){
       getJsonFile('...json5')
       res.json(Mock.mock(json))
   })
  }
// 移除Mock
env.development => MOCK=false
```

<!-- json5 -->

```js
// 读取
fs.readFileSync(path.join(__dirname,xxxPath),'utf-8'))
// 解析
JSON5.parse(json5)
```

<!-- Mock语法 -->

```shell
# 数据模板  'name|rule': value
- string, min-max|count
- number, min-max|min-max.dmin-dmax|+1
- boolean, min-max|1
- object, min-max|count
- array, 1|+1|min-max|count
- function|regexp
# 数据占位符  @占位符 Mock.Random.extend()
- boolean, min?|max?|current?
- natural|integer|float, min?|max?|dmin|dmax
- character|string, lower|upper|number|symbol,min?|max?
- range, start|stop?|step?
+ date|time|datetime|now, y-M-d|H-m-s-ss-SS|t|A|a
# 图片/颜色
+ dataImage,size?text?
+ image, size?background?foreground?format?text?
+ color|hex|rgb|rgba|hsl
# 文字
+ title|ctitle|paragraph|sentence|csentence|word|cword, pool?|min?|max?
+ first|last|name|cfirst|clast|cname|cword
+ url|protocol|domain|tld|email|ip, protocol?|host?
+ region|province|city|county|zip, true?
+ pick|shuffle, arr
+ guid|id|increment, step?
```

#### JSON Server

安装：npm i -g  json-server

创建JSON：db.json

开启服务：json-server --watch db.json --deley 2000

##### 特点：

基于promise的异步ajax请求库

支持请求、响应拦截器

支持请求取消

请求、响应数据转换

批量发送请求

## 附录

#### 存储数据方式

内存：速度快，小容量，非永久

自定义文件：简单直接，不便大数据

Excel/Access格式化：使用广泛，灵活性不足

[专用文件服务器]()：网络存储/云存储，可靠性高

[数据库服务器]()：存取效率高，尤其适合海量数据

#### 数据库种类

网状数据库：二十世纪六十年代初

层次型数据库：二十世纪六十年代末

[关系型数据库（RDBMS）]()：二十世纪七十年代至今

[非关系型数据库（NOSQL）]()：二十一世纪初至今

#### 关系型数据库

SQLite：微型数据库，常用于移动设备

[MySQL]()：开源中小型数据库，可用于各种操作系统

PostgreSQL：开源中小型数据库

SQL Server：Microsoft开发的中型数据库，只用于Window系统

[Oracle]()：Oracle公司开发的中大型数据库，可用于各操作系统

DB2：IBM公司开发的中大型数据库，常与IBM服务器搭配

#### XAMPP

服务器套装：Apache，MySQL

#### MYSQL数据类型

> 数字类型

整数：INT（TINYINT  SMALLINT  BIGINT）

浮点数：DECIMAL（FLOAT  DOUBLE）

> 布尔类型

BOOL|BOOLEAN：1|0，TRUE|FALSE

> 字符串类型

CHAR|VARCHAR：255-65535

TEXT：2^32 - 4G

> 日期类型

YEAR|DATE|TIME|DATATIME(fraction)：BIGINT

DEFAULT  CURRENT_STAMP

ON UPDATE CURRENT_STAMP