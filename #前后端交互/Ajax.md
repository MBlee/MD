## Ajax

~~~js
// 方法
- open('get', 'url', sync)|send()
- abort()
- setRequestHeader('header', 'value')
// 事件
- onreadystatechange|ontimeout
// 属性
- timeout|readyState，0，1，2，3，4
- status，200||304
- responseType|response|responseText
- getResponseHeader()|getAllResponseHeaders()
~~~

**函数封装：**

~~~js
var xhr = new XMLHttpRequest()
if(config.method.toLowerCase() === 'get'){
    if(config.query){
        config.url += '?'
        for (const key in config.query) {
            if (Object.hasOwnProperty.call(config.query, key)) {
                url += `${key}=${config.query[key]}&`
            }
            config.url = config.url.slice(0,-1)
        }
        xhr.open('get',config.url)
        xhr.send()
    }else{
        // post
        let str = ''
        if(config.query){
            for (const key in config.query) {
                if (Object.hasOwnProperty.call(config.query, key)) {
                    str += `${key}=${config.query[key]}&`
                }
            }
            str = str.slice(0,-1)
        }
        xhr.open('post',config.url)
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded')
        xhr.send(str)
    }
    xhr.onreadystatechange||xhr.onload = function(){
        if(xhr.readyState === 4){
            if(xhr.status >= 200||xhr.status < 300){
                let res = config.isJson?JSON.parse(xhr.responseText):xhr.responseText
                config.callback(res)
            }
        }
    }
}
~~~

**类封装**

~~~js
// ajax.js
class Ajax{
  constructor(url,options){
    this.url = url
    this.options = Object.assin({},DEFAULTS,options)
    
    this.init()
  }  
  init(){
    const xhr = new XMLHttpRequest()
    this.xhr = xhr
    this.bindEvent()
    xhr.open(this.options.method,this.addParams(),true)
    xhr.send(this.sendData())
    xhr.responseType = this.options.responseType
    xhr.setHeader('Content-Type',this.options.contentType)
    xhr.setHeader('withCredentials',this.options.withCredentials)
    xhr.timeout = this.options.timeout
  }

  bindEvent(){
    const xhr = this.xhr
    const {success,httpCodeError,error,abort,timeout} = this.options
    xhr.addEventListener('load',_=>{
      if(this.ok()){ success(xhr.response,xhr) }
      else{ httpCodeError(xhr.status,xhr)}
    })
    xhr.addEventListener('error',_=>{
      error(xhr)
    })
    xhr.addEventListener('timeout',_=>{
      timeout(xhr)
    })
    xhr.addEventListener('abort',_=>{
      error(xhr)
    })
  }
  getXHR(){
    return this.xhr
  }
  ok(){
    const xhr = this.xhr
    return (xhr.status >= 200&&xhr.status<300)||xhr.status = 304
  }
  addParam(){
    
  }
}
// defaults.js||constants.js
{
  method:'get'
  params:null
  data:null
  contenType:'application/x-www-form-urlencoded'
  responseType:''
  timeout:0
  withCredentials:false
  success(){}
  error(){}
  abort(){}
  timeout(){}
}
// index.js
const ajax = (url,options)=>{
  return new Ajax(url,options).getXHR()
  return new Ajax(url,{...options,method:'GET'|'POST'}).getXHR()
  return new Ajax(url,{...options,method:'GET',responseType:'json'}).getXHR()
}
~~~

## Fetch

~~~js
// 基于promise
fetch(url,{
  method:"post",
  body:"user=lee&...",
  headers:{
    "Content-Type":"application/x-www...."
  },
  mode:"cors",
  credentials:"include"
}).then{(res)=>{
  if(res.ok) 
  res.json()
  res.text()
  res.formData()
  res.blob()
  res.arrayBuffer()
  else throw res.status
}}.then(data=>).catch(err=>)
~~~

~~~js
// 封装
async function http(obj){
  let {method,url,params,data}=obj,res
  if(params){
    let str = new URLSearchParams(params).toString()
    url += '?'+str
  }
  if(data){
    res = await fetch(url,{method,headers:{"Content-Type":'application/json'},body:JSON.stringify(data)})
  }else{
    res = await fetch(url)
  }
  return res.json()
}
~~~

## $.ajax

~~~js
- $.ajax({url,type,data,dataType,contentType,success,error})
- $.get|post|getJSON(url,data,success)
~~~

## 特点

~~~shell
# 优点
- 浏览器自带-无需插件
- 用户体验-不刷新页面可更新数据
- 提升web性能-按需发送数据
- 减轻服务器和带宽-服务器操作转移到客户端
# 缺点
- 前进|后退功能被破坏-只记录当前页面
- 搜索引擎爬虫无法爬取
~~~

## JSONP

> 借助script标签src属性，在引入外部资源时不受同源策略限制，只能处理get请求

> 服务器之前交流不受同源策略限制

- $.getJSON

```js
// 浏览器
$.getJSON('url?callback=?',function(data){})
// 服务器
res.end(req.query.callback+(data))
```

- 原生

```js
// 浏览器
- creteElement('script').src||append
// 服务器
- res.end('callback()')
```