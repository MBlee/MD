## XMLHttpRequest

- open('get', 'url', sync)
- send()
- onreadystatechange

- ontimeout
- timeout
- readystate，0，1，2，3
- status，200
- responseText

**post请求**

- setRequestHeader('header', 'value')

- getRequestHeader()

  getAllRequestHeader()

- abort()

**封装：**

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
    xhr.onreadystatechange = function(){
        if(xhr.readyState === 4){
            if(xhr.status === 200){
                let res = config.isJson?JSON.parse(xhr.responseText):xhr.responseText
                config.callback(res)
            }
        }
    }
}
~~~



## AJAX

常见状态码

- 100-199，连接继续
- 200-299，各种意义上的成功
- 300-399，重定向
- 400-499，各种客户端错误
- 500-599，各种服务端错误

## HTTP协议

#### 请求

请求头-request header

url

method

query

请求体-request body

#### 响应

响应头-response header

content-type

响应体-response body

响应数据