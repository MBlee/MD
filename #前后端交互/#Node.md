## Node模块

#### Http模块

```js
// 创建服务器
http.createServer((req,res)=>{
    req.url
  	res.statusCode
  	res.setHeader()
    res.writeHead(200,{'Content-Type':'text/html;charset="utf-8"'})
  	res.write("<head><meta charset='UTF-8'></head>")
  	res.end
}).listen(port,url,callback)
// 路由:req.method
- url.parse(req.url).query = new URL(path,base)
- req.addListener('data',(chunk)=>{
    data += chunk
})
- req.addListener('end',()=>{
    queryString.parse(dataStr)
    res.end()
})
```

>  常用模块：url、queryString、path

#### Fs模块

```js
// 检测文件|目录
fs.stat(path,(err,data)=>{
    .isDirectory|.isFile
})
// 文件操作
fs.readdir()
fs.mkdir()
fs.rmdir()

fs.readFile()
fs.writeFile()
fs.appendFile()
fs.rename()
fs.unlink()

// 读取流
fs.createReadStream(_path)
rs.on('data|end|error')
// 写入流
fs.createWriteStream(_path)
ws.write(_data)
ws.end()
ws.on('finish')
// 导流
readStream.pipe(writeStream)
```

#### Formidable

```js
<form enctype='multipart/form-data'>
new formidable.IncomingForm()
form.uploadDir
form.parse(req,(err,fields,files)={

})
```

#### EJS模板引擎

```js
// 后端渲染
ejs.renderFile('.ejs',{data},(err,data)=>{res.end()})
// 模板语法
<%=data%><%%>
```

#### 工具模块

```shell
# 服务器监听重启
cnpm i -g supervisor

# md5加密
npm md5
md5(xxx)

# 日期格式化
npm silly-datetime
sd.format(date,'YYYY-MM-DD HH:mm')
```

#### 搭建服务器

> **静态服务器**

- ext => content-type
- url => readfile

~~~js
// 获取扩展名
const extname = path.extname(pathname)
const mime = fs.readFileSync('mime.json')[extname]
res.writeHead(200,{'Content-Type',mime+';charset=utf-8'})
// 读取文件
const data = fs.readFileSync('./static'+pathname)
res.write(data)
~~~

> **HTTP请求**

#### 封装Express

- app => { _route(req,res)... }
- try...catch => app[ _route ]

## Express

#### 服务器

~~~jsx
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
app.listen(_port)
// 跨域
app.use(cors())
// 数据格式化
app.use(express.json())
app.use(express.urlencoded({extended:true}))
// 静态服务器
app.use(baseUrl,express.static('path'))
// 路由
app.use(baseUrl,router)
~~~

#### 路由

~~~js
// express.Router()
const router = express.Router()
router.use((req,res,next)=>{})
router.all(path,(req,res)=>{})
// express()
app.all(path/:id,(req,res,next)=>{
  req.params['id']
  req.query
  req.body
  res.send()
})
~~~

```js
// req

// res
res.send()
res.sendStatus()

```





#### 脚手架

> npm i  express-generator -g

~~~shell
express --no-view <proname>
npm i
~~~

## MongoDB

安装配置：path: ...\server\4.0\bin

连接：mongo

```shell
# 数据库操作
show dbs
use xxx
db.dropDatabase()
# 集合操作
show collections
db.xx.find().sort().limit().skip() 
-($gle|$lte|/^$/)({name:1})
-(age:1|-1)
db.xx.insert()
db.xx.drop()
# 创建|使用数据库
```

## MockJS

#### 安装

```shell
# mockjs产生模拟数据
cnpm i mockjs -S
# json5解决json无法添加注释问题
cnpm i json5 -S
```

#### 使用

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

#### 附录

<!-- **json5 -->

```js
// 读取
fs.readFileSync(path.join(__dirname,xxxPath,'utf-8'))
// 解析
JSON5.parse(json5)
```

<!-- Mock语法 -->

```js
// 数据模板  'name|rule': value
- string, min-max|count
- number, min-max|min-max.dmin-dmax|+1
- boolean, min-max|1
- object, min-max|count
- array, 1|+1|min-max|count
- function|regexp
// 数据占位符  @占位符 Mock.Random.extend()
- boolean, min?|max?|current?
- natural|integer|float, min?|max?|dmin|dmax
- character|string, lower|upper|number|symbol,min?|max?
- range, start|stop?|step?
+ date|time|datetime|now, y-M-d|H-m-s-ss-SS|t|A|a
+ image|dataImage, size?|background?|foreground?|format?|text?
+ color|hex|rgb|rgba|hsl
+ title|ctitle|paragraph|sentence|csentence|word|cword, pool?|min?|max?
+ first|last|name|cfirst|clast|cname|cword
+ url|protocol|domain|tld|email|ip, protocol?|host?
+ region|province|city|county|zip, true?
+ pick|shuffle, arr
+ guid|id|increment, step?
```

## 跨域

#### Proxy代理服务器

**Cli3：vue.config.js > devServer > proxy**

'/api'

- target: xxxUrl
- pathRewrite: {'^/api': ''}
- changeOrigin: true
- ws: true

axios.defaults.baseURL = '/api'

**Cli2：config > index.js > proxyTable**

#### CORS

**Access-Control-Allow-Origin**

后端开启，返回响应加几个特殊的响应头

#### JsonP

借助script标签src属性，在引入外部资源时不受同源策略限制，只能处理get请求

#### 知识点

服务器之前交流不受同源策略限制

## HTTP

#### HTTP-Header

```js
// Content-Type:
1. text/plain
2. application/json
  - JSON.stringfy( xxxobj )
3. application/x-www-form-urlencoded
  - a=xxx&b=xxx
4. multipart/form-data
// Autorization:
- localStorage.getItem("token")
```

#### HTTP-Response

```js
// Access-Control-Allow-Origin
// Access-Control-Allow-Headers
// Access-Control-Allow-Method
```

#### HTTP-配置

```js
// timeout
// headers['Content-Type']，withCredentials
// transformRequest：
- qs.stringfy(data)
// request拦截器:
- req.headers.Autorization = token
// response拦截器:
- res.data
- err, { res }
  - res.status
  - window.navigator.onLine
```

## 实例

#### NO1

```shell
# 初始化包
npm init -y
# 安装包
npm i express@4.17.1
npm i cors@2.8.5
```

```js
const express = require('express')
const app = express()
// 启动web服务器|端口号
app.listen(3000,function(){})
```

```js
// 跨域中间件
const cors = require('cors')
app.use(cors())
// 表单中间件
app.use(express.urlencoded({extended:false}))
```

