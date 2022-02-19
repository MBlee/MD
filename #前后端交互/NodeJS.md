# Node模块

### Http模块

```js
//创建服务器
http.createServer((req,res)=>{
    req.url
    res.writeHead
    res.write
    res.end
}).listen(port,url)
```

### Url模块

```js
//解析URL
url.parse(url,true).query|pathname = new URL(path,base)
```

### Fs模块

```js
//检测文件|目录
fs.stat(path,(err,data)=>{
    .isDirectory|.isFile
})
fs.readdir()
fs.mkdir()
fs.rmdir()
//文件操作
fs.readFile()
fs.writeFile()
fs.appendFile()
fs.rename()
fs.unlink()
```

### POST请求

```js
req.addListener('data',(chunk)=>{
    data += chunk
})
req.addListener('end',()=>{
    queryString.parse(dataStr)
    res.end()
})
```

### Formidable

```js
<form enctype='multipart/form-data'>
new formidable.IncomingForm()
form.uploadDir
form.parse(req,(err,fields,files)={

})
```

### 工具模块

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

# Express

# MongoDB

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
