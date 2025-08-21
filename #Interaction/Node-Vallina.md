## Node

```js
// Processs
process.cwd()
process.pid|argv[2]
```

### ChildProcess

```ts
// Spawn
- cp.spawn('cmd',[args...],{cwd})
- p.stdout|stderr.on('data|err',std=>{})
- p.on('close',closeCode=>{})
```

```ts
// 创建多线程
const cp = require('child_process')
- process.pid|argv[2]

const wp = cp.exec('node command.js i',(err,stdout,stderr)=>{})
wp.on('exit',code=>{})
      
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

> ```shell
> npm: fs-extra  graceful-fs  ncp
> ```

```ts
// 转Promise
require('node:fs/promises') // v14
require('fs').promises	// v10 ~ v14
import {promisify} from 'util' // v8 ~ v10
const read = promisify(fs.readFile)
```

```js
// 检测文件|目录
fs.stat('path',(err,stat)=>{
    stat.isDirectory()|.isFile()|.isSymbolicLink()
  	stat.size
})
// 文件操作
fs.readdir(path,(err,files)=>void)
fs.mkdir(path,{recursive},err=>void)
fs.rm(path,{recursive,force},err=>void)
fs.readFile(path,(err,data)=>void)
fs.writeFile(path,data,encode,err=>void)
fs.appendFile(path,data,err=>void)
fs.rename(path,newName)
fs.unlink(path,err=>void)
// 标识符操作
fs.open(path,flags)
fs.close(fd)
fs.read(fd,buffer,offset,length,position,(err,bytesRead,buffer)=>void)
fs.write(fd,buffer,offset,length,position,(err,bytesWritten,buffer)=>void)
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

```shell
# Path/Encode
- string|Buffer.from(string)
- new URL('file://localPath')
# 文件系统标志(rwa+)
- a+ (已存追加)
- r+ (已存读写)
- w+ (所有读写)
- a (所有追加)
# 文件标识符(数字)
- fs.open(path,flags)
```

```ts
// 文件路径
const path = require('node:path')
path.dirname(path)
path.basename(path,suffix)
path.extname(path)
path.join('/','path1','path2')
path.resolve('/','path1','path2')
path.normalize('path')
```

#### Buffer

> ```shell
> TypedArray/Uint8Array/Buffer 
> ```

```ts
// Establish
Buffer.alloc(len,fill,encode)|allocUnsafe.fill
Buffer.from(LikeArray|Buffer)
Buffer.from(ArrayBuffer,offset,len)
Buffer.copyBytesFrom(TypedArray,offset,len)
// Manipulate
Buffer.concat(Buffer[])
Buffer.isBuffer|byteLength
Buffer.compare(b1,b2)
buf.slice(start,end)
buf.readInt8(offset)
buf.writeInt8(value,offset)
buf.toString(encode,start,end)
```

#### Stream

> ```shell
> Readable/Writeable
> ```

```ts
// Readable(highWaterMark,encoding,flowing,Iterator...)
// Events
- close/error
- data/readable/end
- pause
// Methods
- distroy
- pause/resume/pipe/unpipe
- read
```

```ts
// Writable
// Events
- close/error
- drain/finish
- pipe/unpipe
// Methods
- distroy
- write/end/cork/uncork
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
# 服务器重启：supervisor
# md5加密：md5
# 日期格式化：silly-datetime
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