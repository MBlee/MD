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
const cookieParser = require('cookie-parser')
const app = express()
app.listen(_port)
app.use((req,res,next)=>...)
// 跨域
app.use(cors())
// 数据格式化
app.use(express|bodyParser.json())
app.use(express|bodyParser.urlencoded({extended:true}))
// cookie
app.use(cookieParser('signed'))
res.cookie(key,value,{maxAge,signed,domain,path})
res.cookies.key
res.signedCookies.key
// 静态服务器
app.use(baseUrl,express.static('path'))
// 路由
app.use(baseUrl,router)
~~~

<!--服务器请求-->

```js
const request = require('request')
const options = {
    headers:{'Connection':'close'},
    url,method,
    json:true,
    body
}
const callback = (err,res,data)=>{
    if(!err && res.statusCode == 200){
        res.json(data)
    }
}
request(options,callback)
```

#### 路由

~~~js
// express.Router()
const router = express.Router()
router.use((req,res,next)=>{})
router.all(path,(req,res)=>{})
// express()
app.all(path/:id,(req,res,next)=>...)
// req
req.params['id']
req.query
req.body
// res
res.send()|sendStatus()|status()
~~~

#### 模板引擎

```shell
npm i ejs
```

```js
const ejs = require('ejs')
app.engine('html',ejs.__express)
app.set('view engine','html|ejs')
app.set('views',__dirname+'/views')
res.render('index',{})
```

```ejs
<%=text%>
<%-html%>
<%-include('.ejs')%>
<%if(){%>...<%}%>
<%for(){%>...<%}%>
```

#### 脚手架

> npm i  express-generator -g

~~~shell
express --no-view <proname>
npm i
~~~

## Koa

```shell
npm i koa @koa/router
```

```js
const Koa = require('koa')
const Router = require('@koa/router')

const app = new Koa()
const router = new Router()

app.use(async (ctx,next)=>{
    ctx.body = 'hello'
})
router.get('/',async(ctx)=>{...})
app.use(router.routes()).use(router.allowedMethods())

app.listen(9000)
```

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

