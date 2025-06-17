## Node

```js
// 当前路径
process.cwd()
```

### ChildProcess

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

### Local

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

#### 

### Net

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

> 常用模块：url、queryString、path

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