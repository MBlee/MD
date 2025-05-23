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
// 错误处理器
app.use((req,res,next)=>{
  next(httpErrors(404,'NOTFOUND')|'route')
})
app.use((err,req,res,next)=>{
  // Error Logger
  console.error(err.stack)
  next(err)
  // Client Error
  if (req.xhr) {
    res.status(500).send({ error: 'Something failed!' })
  } else {
    next(err)
  }
  // Res Error
  if (res.headersSent) {
    return next(err)
  }
  res.status(500).send(err)
})
```

```ts
// 错误调试（debug）
const debug = require('debug')('symbol')
SET DEBUG=*
// 错误调试（morgan）
app.use(require('morgan')(<formate>,opts))||morgan('combined')(req,res,err=>...)
- formate:'combined|common|dev|tiny'
	':method :url :status'
	':res[content-length] - :response-time ms'
- opts.stream: 'npm:rotating-file-stream'
- opts.skip: (req,res)=> res.statusCode<400
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
// npm: koa-jwt
const jwt = require('koa-jwt')({secret})
router.get('',jwt,async(ctx,next)=>{})
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
// npm: koa-compose glob
glob.sync(__dirname,'./','**/*.js')
.filter(d=>d.indexOf('index.js')===-1)
.forEach(r=>
         routers.push(r.routes())
         routers.push(r.allowedMethods())
)
compose(routers)
// 文件路由
const relative = path.relative(basePath,item)
const extname = path.extname(item)
const fileRoute = '/'+relative.split(extname)[0]
const key = '_'+method+'_'+fileRouter
routerMap[key]=handler
```

## Nest

```shell
# npm i @nestjs/cli -g
nest new <app> -p pnpm
nest g controller <controller> --flat|--no-flat
nest g provider|service <service>
nest g resource xx
# 打包
nest build
	--path <tsconfig-path>
	--watch
	--builder <tsc|webpack|swc>
# 调试
- nest start -d|--debug 8088 --watch
=> chrom://inspect
- vscode => Toggle Auto Attach
- lanch.json => Program
```

```shell
# nest-cli.json
- $schema:"https://json.shemastore.org/nest-cli"
- collection:"@nestjs/schematics"
- sourceRoot:'src'
- generateOptions:{ flat,spec }
- compilerOptions:{
  'webpack':false, 'deleteOutDir':true,
  "builder":'tsc',
  "watchAssets":false
}
```

```ts
// app.module.ts
import {Module} from '@nestjs/common'
@global()
@Module({
	imports:[modules...],
    controllers:[controllers...],  
    providers:[service...],
  	exports:[modules|services...]
})
class Module{
  constructor(private service:Service){}
}
// 路由：xx.controller.ts
import { Controller...} from '@nestjs/common'
@Controller('route')=> constructor(private service:Service)
@Get(':route')
@Req(uest)?|Res(ponse)?({passthrough:true})
@Params|Query|Body|Session
@Request.signedCookies|@Response.cookie
@Request.session
@Headers('name')
@Ip|HostParam
@Next
@HttpCode(204)
@Header(key,value)
@Redirect(url,301)
// 路由处理器：xx.service.ts
@Injectable|Inject => private service:Service
// 管道：xx.pipe.ts
@Injectable() => PipeTransform => @UsePipes(new XPipe())
transform(value:any,metadata:ArgumentMetadata)=> value
// 守卫：xx.guard.ts
import {Observable} from 'rxjs'
@Injectable() => CanActivate => @UseGuards(AuthGuard)
canActivate(context:ExecutionContext):boolean|Promise<Boolean>|Observable<boolean> => context.switchToHttp().getRequest().session
app.useGolobalGuards(new AuthGuard())
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
// 异常过滤器
throw new HttpException('forbidden',HttpStatus.FORBIDDEN,{cause,description})
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

```ts
// Mongoose数据库
// @nestjs/mongoose mongoose
>>> app.module.ts //数据库连接
import {MongooseModule} from '@nest/js/mongoose'
@Module({
  imports:[MongooseModule.forRoot('mongodb://host/nest')]
})
>>> schema //数据表
import * as mongoose from 'mongoose'
export new mongoose.Schema({...})
>>> child.module.ts //数据库操作
@module({
  imports:[MongooseModule.forFeature(models?:{name,schema,collection?}[],connectionName?:string):DynamicModule]
})
>>> xx.service.ts
constructor(@InjectModel('Article') private readonly articleModel) => this.articleModel.find().exec()
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

```js
/*  Cheerio  */
const $ = cheerio.load('htmlStr')
$('img').attr('src').each(index,item=>...)
```

## ------------------

## Node

```js
// 当前路径
process.cwd()
```

#### Http

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

#### Fs

```ts
// 转Promise
require('node:fs/promises') // v14
require('fs').promises	// v10 ~ v14
import {promisify} from 'util' // v8 ~ v10
const read = promisify(fs.readFile)
```

```ts
// 文件路径
const path = require('node:path')
path.dirname('path')
path.basename('path','ext')
path.extname('path')
path.join('/','path1','path2')
path.resolve('/','path1','path2')
path.normalize('path')
```

```js
// 检测文件|目录
fs.stat('path',(err,stats)=>{
    stats.isDirectory()|.isFile()|.isSymbolicLink()
  	stats.size
})
// 文件夹操作
fs.readdir('path',(err,files)=>void)
fs.mkdir('path',{recursive},err=>void)
fs.rmdir('path',{recursive},err=>void)
// 文件操作
fs.open('path','r|w|a|a+')
fs.readFile(path,(err,data)=>void)
fs.writeFile(path,data,err=>void)
fs.appendFile(path,data,err=>void)
fs.rename(path,newName)
fs.unlink(path,err=>void)
```

```ts
// 读取流
fs.createReadStream(_path)
rs.on('data|end|error')
// 写入流
fs.createWriteStream(_path,{flags:'a|r|w'})
ws.write(_data)
ws.end()
ws.on('finish|err')
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

```ts
Buffer.alloc(length,1)|allocUnsafe
Buffer.from([...]|any)
Buffer.concat([...buffers]).toString('utf-8|base64|hex')
Buffer.isBuffer|byteLength
```

#### Events

```ts
const {EventEmitter} = require('events')
EventEmitter.on|once(event,func)
EventEmitter.removeListener(event,func)
EventEmitter.removeAllListeners(event)
EventEmitter.emit(event,...args)
EventEmitter.setMaxListeners(n)
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

#### 网络通信

```ts
/*  TCP  */ 
// 服务器
import net form 'node:net'
const server = net.createServer((socket)=>{})
server.listen({port,host},cb)
// 事件/方法
server.on("err",err=>{})
server.on("close",cb)
server.on("listening",cb)
server.on("connection",cb)
```

```ts
/*  UDP  */
// 服务器
import dgram from 'node:dgram'
const server = dgram.createSocket('udp4')
server.bind(port)
// 事件/方法
server.on('err',err=>{})
server.on('close',()=>{})
server.on('listen',()=>{})
server.on('message',(msg,info)=>{})
server.send(data)
```

```ts
/*TLS/SSL*/
```

#### 用户鉴权

```ts
// JWT
- <Header>.<Payload>.<Secret>
const {sign} = require('jsonwebtoken')
const secret = 'secret'
const token = sign({user},secret,{expiresIn:'1h'})
```

#### 进程管理

```ts
// 创建多线程
const cp = require('child_process')
- process.pid|argv[2]

const wp = cp.exec('node command.js i',(err,stdout,stderr)=>{})
wp.on('exit',code=>{})

const wp = cp.spawn('node',['command.js',i])
wp.stdout.on('data',stdout=>{})
wp.stderr.on('data',stderr=>{})
wp.on('close',code=>{})
      
const wp = cp.fork('command.js',[i])
wp.on('close',code=>{})
// 进程通信(IPC)
const n = cp.fork('child.js')
n.on('message',msg=>{})
n.send('msg')

process.on('message',msg=>{})
process.send('msg')
// 进程通信(Socket)
const {spawn} = require('child_process')
const child = spawn('node',['child'],{
    stdio:[null,null,null,'pipe']
})
child.stdio[1].on('data',data=>{})

const pipe = net.Socket({fd:1})
pipe.write('hello main process!')
```

#### 日志管理

```ts
const log4js = require('log4js')
const logger = log4js.getLogger()
logger.level = 'debug'
logger.debug('msg')
// 日志级别
all|trace|debug
info|warn|error
fatal|mark|off
// 日志分类
log4js.configure({
    appenders:{
		out:{type:'stdout'}
        app1:{type:'file',filename:'1.log'}
    },
    categories:{
		default:{appenders:['out'],level:'trace'},
        app1:{appenders:['app1'],level:'trace'}         
	}
})
const app1Log = log4js.getLogger('app1')
// 日志分类
log4js.configure({
    appenders:{
        app:{
            type:'dateFile',
            filename:'application',
            alwaysIncludePattern:true,
            pattern:'yyyy-MM-dd-hh.log'
        }
    },
    categories:{
        default:{
            appenders:['app'],level:'trace'
        },
        app:{
            appenders:['app'],level:'trace'
        }
    }
})
const appLog = log4js.getLogger('app')
```



#### ......

#### 异步工作

> [事件循环]()：执行事件回调，非阻塞I/O回调（Net）。例如，正则表达式，同步API，JSON解析。
>
> [防阻塞]()：分割，移入workerPool

> [workerPool]()：执行IO/CPU密集操作，在libuv上实现。例如，DNS、FS、Crypto、Zlib。
>
> [防阻塞]()：分割

#### 文件操作

#### 命令行

#### 模块

## Debug

#### 调试

```shell
### 实时调试
```

```shell
### 内存分析
# Heap Profiler
- Allocation instrumentation timeline
- Allocation sampling
# Heap Snapshot
# GC Traces
```

```shell
### 性能分析
```

```shell
### 火焰图
```

#### 测试

> 测试框架：Mocha/Jest、Nodeunit、Vors

```ts
// node:assert
const assert = require('node:assert').strict
const {message,name} = new assert.AssertionError({actual,expected,operator})
assert.strictEqual(1,2)
assert.deepStrictEqual()
// vows
const suite = vows.describe('desc')
suite.addBatch({
  'test1':{
	topic:()=>{}|{},
  	'test1-1':topic=>{}
  }
})
```

```ts
// nodeunit
// nodeunit unit.js
module.exports={
  'test':test=>{
   	test.expect(2)
    test.equal|notEqual|deepEqual()
    test.done()
  }
}
```

```ts
// mocha
// mocha test.js
describe('',()=>{
  it('test',fn)
})
```

#### 攻防