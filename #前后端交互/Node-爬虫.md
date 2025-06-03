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

## 