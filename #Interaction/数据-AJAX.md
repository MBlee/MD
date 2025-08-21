#### Ajax

```js
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
```

**函数封装：**

```js
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
```

**类封装**

```js
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
```

> $.ajax

```js
- $.ajax({url,type,data,dataType,contentType,success,error})
- $.get|post|getJSON(url,data,success)
```

```shell
# 优点
- 浏览器自带-无需插件
- 用户体验-不刷新页面可更新数据
- 提升web性能-按需发送数据
- 减轻服务器和带宽-服务器操作转移到客户端
# 缺点
- 前进|后退功能被破坏-只记录当前页面
- 搜索引擎爬虫无法爬取
```

常见状态码

- 100-199，连接继续
- 200-299，各种意义上的成功
- 300-399，重定向
- 400-499，客户端错误
- 500-599，服务端错误

# 网络知识

### 浏览器渲染页面过程

字节HTML→字符HTML→Token符号标签节点→DOM

核心：

1. 构建DOM→（JS）→Link构建CSSDOM
2. 构建渲染树→布局→绘制

### 从URL到显示页面

1. DNS域名解析
   - 先查缓存
     - 浏览器缓存（强缓存→协商缓存）内存|硬盘
     - 系统缓存（hosts）
     - 路由器缓存
     - DNS服务器缓存|SP（互联网提供商）缓存
   - DNS服务器查找