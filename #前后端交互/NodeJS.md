# Node

### Http模块

```js
// 创建服务器
http.createServer((req,res)=>{
    req.url
    res.writeHead{200,{'Content-Type:text/html;charset="utf-8"'}}
    res.write("<head><meta charset='utf-8'></head>")
    res.end
}).listen(port,url)
// 静态服务器
1. path.extname(url.parse(req.url).pathname)
- readFileSync('mine.json')
2. readFile('./static'+pathname)
- writeHead
- end
// 路由:req.method
- url.parse(req.url).query
- req.addListener('data',(chunk)=>{
    data += chunk
})
- req.addListener('end',()=>{
    queryString.parse(dataStr)
    res.end()
})
```

### Url模块

```js
// 解析URL
url.parse(url,true).query|pathname = new URL(path,base)
```

### Fs模块

```js
// 检测文件|目录
fs.stat(path,(err,data)=>{
    .isDirectory|.isFile
})
fs.readdir()
fs.mkdir()
fs.rmdir()
// 文件操作
fs.readFile()
fs.writeFile()
fs.appendFile()
fs.rename()
fs.unlink()
// 文件流
fs.createReadStream.on('data|end|error')
fs.createWriteStream.write(data)
fs.createWriteStream.end()
fs.createWriteStream.on('finish')
readStream.pipe(writeStream)
```

### Formidable

```js
<form enctype='multipart/form-data'>
new formidable.IncomingForm()
form.uploadDir
form.parse(req,(err,fields,files)={

})
```

### EJS模板引擎

~~~js
// 后端渲染
ejs.renderFile('.ejs',{data},(err,data)=>{res.end()})
// 模板语法
<%=data%><%%>
~~~

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

### 封装

~~~shell

~~~



# Express

# 实例

### NO1

~~~shell
# 初始化包
npm init -y
# 安装包
npm i express@4.17.1
npm i cors@2.8.5
~~~

~~~js
const express = require('express')
const app = express()
// 启动web服务器|端口号
app.listen(3000,function(){})
~~~

~~~js
// 跨域中间件
const cors = require('cors')
app.use(cors())
// 表单中间件
app.use(express.urlencoded({extended:false}))
~~~

