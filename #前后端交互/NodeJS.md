# Node模块

### Http模块

~~~js
//创建服务器
http.createServer((req,res)=>{
	req.url
	res.writeHead
	res.write
	res.end
}).listen(port,url)
~~~

### Url模块
```js
//解析URL
url.parse(url,true).query|pathname
```

### Fs模块

```js
//检测文件|目录
fs.stat(path,callback{
	stat.isDirectory
})
//文件操作
fs.mkdir(path)
fs.writeFile()
fs.appendFile()
fs.rename()
fs.rmdir()
fs.unlink()
fs.readFile()
fs.readdir()
```

### POST请求

~~~js
req.addListener('data',(chunk)=>{
    data += chunk
})
req.addListener('end',()=>{
    queryString.parse(dataStr)
    res.end()
})
~~~

### Formidable

~~~js
<form enctype='multipart/form-data'>
new formidable.IncomingForm()
form.uploadDir
form.parse(req,(err,fields,files)={
    
})
~~~

### 工具模块

~~~shell
# 服务器监听重启
npm supervisor

# md5加密
npm md5
md5(xxx)

# 日期格式化
npm silly-datetime
sd.format(date,'YYYY-MM-DD HH:mm')
~~~



# Express





# Mongoose

