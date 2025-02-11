## HTTP协议

### HTTP-Client

~~~shell
# Content-Type:
1. text/plain
2. application/json
  - JSON.stringfy( xxxobj )
3. application/x-www-form-urlencoded
  - a=xxx&b=xxx
4. multipart/form-data
# Autorization:
- localStorage.getItem("token")
~~~

### HTTP-Server

~~~js
// Access-Control-Allow-Origin
// Access-Control-Allow-Headers
// Access-Control-Allow-Methods
// Content-Type
- text/html;charset='utf-8'
~~~

### HTTP-配置

~~~js
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
~~~

### 跨域

~~~shell
### Proxy代理服务器

# Cli3：vue.config.js > devServer > proxy

'/api'
- target: xxxUrl
- pathRewrite: {'^/api': ''}
- changeOrigin: true
- ws: true

axios.defaults.baseURL = '/api'

# Cli2：config > index.js > proxyTable
~~~

~~~shell
### CORS
Access-Control-Allow-Origin
Access-Control-Allow-Header
Access-Control-Allow-Methods
后端开启，返回响应加几个特殊的响应头
~~~

~~~shell
### JsonP

借助script标签src属性，在引入外部资源时不受同源策略限制，只能处理get请求
~~~

~~~shell
// 服务器之前交流不受同源策略限制
~~~

### HTTP协议

~~~shell
# 基与TCP，面向连接的协议，请求响应协议
# 建立连接-3次握手：A>B>A>B
# 断开连接-4次挥手：A>B>A*2>B
~~~

~~~shell
# 请求响应过程
1.查询IP
浏览器缓存
~~~

~~~shell
# GET
- 大小限制|4K
- 不安全-明文传输
# POST
- 无限制|2G
- 安全-放请求体里
~~~

#### 请求

请求头-request header

url | method | query

请求体-request body

#### 响应

响应头-response header

content-type

响应体-response body

响应数据

~~~js
// 常见状态码
- 100-199，连接继续
- 200-299，成功
- 300-399，重定向
- 400-499，客户端错误
- 500-599，服务端错误
~~~

## HTTP压缩

```shell
# HTTP压缩之压缩请求体，HTTP/2使用HPACK来压缩头文件
```

``` ts
// 内置zlib模块（只压缩请求体、压缩尺寸限制）
const zlib = require('zlib')
const raw = fs.createReadStream('filePath')
cosnt acceptEncoding = req.headers['accept-encoding']||''
res.setHeader('Content-Type','text/plain')
if(acceptEncoding.includes('gzip')){
  res.setHeader('Content-Encoding','gzip')
  raw.pipe(zlib.createGzip()).pipe(res)
}else{ raw.pipe(res) }
// 检测Gzip
curl -H 'Accept-Encoding:gzip' <url> | xxd // view binary representation
curl -H 'Accept-Encoding:gzip' <url> | gunzip // decompress
curl -H 'Accept-Encoding:gzip' <url> | wc -c // 比较大小
```

## HTTPS与TLS

