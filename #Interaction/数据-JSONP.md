#### JSONP

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

#### 