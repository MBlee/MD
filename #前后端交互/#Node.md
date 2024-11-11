## Express

#### 服务器

```ts
// HTTP服务器
const express = require('express')
const app = express()
app.listen(_port)
app.use((req,res,next)=>...)
// 跨域
const cors = require('cors')
app.use(cors())
// 静态服务器
app.use(baseURL,express.static('path'))
// 路由
app.use(baseURL,routes)
```

```ts
// 错误调试（debug）
const debug = require('debug')('symbol')
SET DEBUG=*
// 错误调试（morgan）
app.use(require('morgan')())
// 错误生成器（@hapi/boom）
const Boom = require('@hapi/boom')
Boom.isBoom(err)
new Boom(err,{statusCode,err,message})
Boom.boomify(err)
Boom.badRequest(err,data)
```

```ts
// express-validator
const {query,body,validationResult,matchedData} = require('express-validator')
app.use(path,
    query('xx')
    .notEmpty()
    .escape()
    .trim()
    .isEmail()
)
app.use((req,next)=>{
    const err = validationResult(req)
    if(!err.isEmpty()) next(err.array())
    const [{msg}] = err.errors
    next(Boom.badRequest(msg))
})
// 国际化（i18n）
// body-parser
const bodyParser = require('body-parser') => req.body
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))
// multer
const multer = require('multer') => req.file|files|body
multer({
    dest|storage:{
        destination:(req,file,cb)=>cb(null,'dest'),
        filename:(req,file,cb)=>cb(null,'filename')
    },
    limits:{filesize},
    fileFilter:(req,file,cb)=>cb(null,false|err)
})
```

```jsx
// cookie
const cookieParser = require('cookie-parser')
app.use(cookieParser('signed'))
req.cookies|signedCookies.key
res.cookie(key,value,{maxAge,signed,domain,path,httpOnly})
// session
const session = require('express-session')
const MongoStore = require('connect-mongo')(session)
app.use(session({
    secret:'secStr',
    name:'cookieName',
    cookie:{maxAge,secure},
    rolling:true,
    resave:false,
    saveUninitialized:true,
    store: new MongoStore({
        url:'',
        mongoOptions
    })
}))
req.session.username = 'str' // 设置
req.session.username = '' // 清除
req.session.cookie.maxAge=0 // 销毁
req.session.destroy(err=>...) // 销毁
// jsonwebtoken
const jwt = require('jsonwebtoken')
const token = jwt.sign({exp,data},secretKey,{
    expiresIn:'1h'
})
const deToken = jwt.vertify(token,secretKey,(err,data)=>...)
```

<!--服务器请求-->

```js
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
http.request(options,callback)
```

#### 路由

```js
// express.Router()
const router = express.Router()
router.use((req,res,next)=>{})
router.all(path,(req,res)=>{})
// express()
app.all(path/:id,(req,res,next)=>...)
- 'path/:a(\\d)'
- 'path/:a.:b'
- 'path/:a-:b'
- /^.$/
// req
req.params['id']
req.query
req.body
// res
res.send()|sendStatus()|status()
```

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

#### ......

#### 脚手架

> npm: express-generator

```shell
express --no-view <proname>
npm i
```

## Koa

```shell
- koa-onerror | koa-logger
- @koa/cors
- @koa/router
- @koa/multer
- koa-static | koa-mount
- koa-bodyparser | koa-params | koa-bouncer
- koa-session
```

```ts
// ctx
app.use(async (ctx,next)=>{
    ctx.redirect('')
    ctx.query|params|request.body
    ctx.status|statusCode
    ctx.body = 'hello'
})
// npm: koa-logger koa-onerror
app.use(logger())
onError(app)
```

```js
// npm: @koa/cors
app.use(Cors())
// npm: @koa/multer
const upload = multer({dest}|{
    storage:multer.diskStorage({
        destination:(req,file,cb)=>{
            cb(null,'upload')
        },
        filename:(req,file,cb)=>{
            cb(null,file.fieldname|originalname + Date.now())
        }
    })
})
app.use('/',   
      upload.single('avatar')
        .array('photos',maxCount)
        .fields([{name,maxCount}]),
    ctx=>{
        ctx.files|file
    }
)
// npm: koa-bodyparser
app.use(BodyParser())
ctx.request.body
// npm: koa-validate
// npm: koa-bouncer
app.use(Bouncer.middleware())
ctx
    .validateBody|Query|Params('filed')
    .check|checkNot(boolean,'msg')
    .required('msg')
    .isString()
    .trim()
    .isLength(min,max,'msg')
    .eq(ctx.vals.password,'')
    .match(/^$/i,'msg')
// cookies
ctx
    .cookies.set('key','value',{maxAge})
    .cookies.get('key')
// npm: koa-session
app.keys = ['secret'...]
app.use(session({
    key:'sid',
    maxAge:60000*60*24,
    httpOnly:true,
    signed:true
},app))
ctx.session.xx?
// npm: trek-captcha
captcha({size}) => {buffer,token}
// npm: svg-captcha
captcha.create({size}) => {data,text}
```

```ts
// npm: @koa/router
const router = new Router()
router.prefix('/')
router.use|get|post('/',(ctx,next)=>...)
app.use(router.routes).use(router.allowedMethods)
// npm: koa-static koa-mount
app.use(mount('prefix',static(path)))
```

## Nest

```shell
# npm i @nestjs/cli -g
nest new <app>
nest g controller <controller> 
nest g provider|service <service>
```

```ts
// 路由：xx.controller.ts
import { Controller...} from '@nestjs/common'
@Controller('route')
@Get(':route')
@Request|Response
@Params|Query|Body|Session
@Request.signedCookies|@Response.cookie
@Request.session
@Next
// 路由处理器：xx.service.ts
@Injectable => providers:[...service] => private service:Service
// app.module.ts
import {Module} from '@nestjs/common'
@Module({
    import:[],
    providers:[],
    controllers:[controller...]
})
```

```ts
// 路由中间件
// 创建
@injectable()
class Logger implements NestMiddleware{
  use(req:Request,res:Response,next:Function){
    next()
  }
}
// 应用
class AppModule implements NestModule{
  configure(consumer:MiddlewareConsumer){
    consumer
      .apply(Logger...)
      .excludes(...)
      .forRoutes({path,method:RequesMethdod.ALL},
                'path/(.reg)',Controller...)
  }
}
```

```ts
// main.ts
import {NestFactory} from '@nestjs/core'
import {NestExpressApplication} from '@nestjs/platform-express'
const app = await NestFactory.create<NestExpressApplication>(AppModule)
// 静态目录
app.useStaticAssets(join(__dirname,'..','public'),{prefix})
// 模板引擎
app.setBaseViewsDir(join(__dirname,'..','views'))
app.setViewEngine('hbs') => @Render('views')
await app.listen(3000)
// 全局中间件
app.use(Logger)
// 文件上传
>>>@types/multer>>>Express.Multer.File
>>>MulterModule.register(Async)?({dest|useFactory()=>{dest}})
@Post('upload')
@useInterceptors(
  FileInterceptor('file'|{name,maxCount}),{dest}
  |AnyFilesInterceptor|NoFilesInterceptor
)
uploadFile(@uploadedFiles?() files?:Express.Multer.File){
  const writeStream = createWriteStream('path')
  writeStream.write(file.buffer)
}
```

## ------------------

## 爬虫

#### 网络请求

> http.request

```js
const req = http.request({
    hostname,path,headers
},res=>{
    res.on('data',buffer=>...)
    res.on('end',_=>Buffer.concat(buffers))
})
req.end()
```

> **npm: request-promise-native**

```js
rn({url}).then()
```

> **npm:  download**

#### HTML解析

###### Cheerio

```js
const $ = cheerio.load('htmlStr')
$('img').attr('src').each(index,item=>...)
```

## ------------------

## Node

```js
// 当前路径
process.cwd()
```

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
// Promisify
import {promisify} from 'util'
const read = promisify(fs.readFile)
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

```js
// 文件复制
// npm: ncp
const ncp = require('ncp').ncp
ncp(source,destination,err=>...)
// 文件流
const fs = require('fs');
const path = require('path');
function copyFiles(sourceDir, destDir) {
  fs.readdir(sourceDir, (err, files) => {
    if (err) throw err;

    files.forEach(file => {
      const sourceFilePath = path.join(sourceDir, file);
      const destFilePath = path.join(destDir, file);      
      const readStream = fs.createReadStream(sourceFilePath);
      const writeStream = fs.createWriteStream(destFilePath);

      readStream.pipe(writeStream);
    });
  });
}
// fs.copyFile
const fs = require('fs');
const path = require('path');
function copyFiles(sourceDir, destDir) {
  fs.readdir(sourceDir, (err, files) => {
    if (err) throw err;
    files.forEach(file => {
      const sourceFilePath = path.join(sourceDir, file);
      const destFilePath = path.join(destDir, file);
      fs.copyFile(sourceFilePath, destFilePath, err => {
        if (err) throw err;
        console.log(`${file} copied successfully.`);
      });
    });
  });
}s
```

#### Buffer

```js
Buffer.alloc(length,1)
Buffer.from([...])
Buffer.concat([...buffers]).toString('utf-8|base64')
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

```js
// 获取扩展名
const extname = path.extname(pathname)
const mime = fs.readFileSync('mime.json')[extname]
res.writeHead(200,{'Content-Type',mime+';charset=utf-8'})
// 读取文件
const data = fs.readFileSync('./static'+pathname)
res.write(data)
```

> **HTTP请求**

#### 封装Express

- app => { _route(req,res)... }
- try...catch => app[ _route ]

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

## 
