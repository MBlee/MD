#### Cookie

```js
// 查询
(key)=>{
  key = '${encodeURIComponent(key)}'
  cookies = document.cookie.split('; ')
  for(const item of cookies){
    [ckey,cvalue] = item.split('=')
    if(ckey === key) return decodeURIComponent(cvalue)
  }
  return
}
// 添加
(key,value,{maxAge,domain,path,secure}={})=>{
	cookie = '${encodeURIComponent(key)}=${encode(value)}'
	if(typeof maxAge === "number")
      cookie += '; max-age=${maxAge}'
	if ...
	  cookie += '; domain=${domain}'
	document.cookie = cookie;
}
// 删除
(key,{domain,path}={}){
	set(key,'',{domain,path,maxAge:-1})
}
```

查询：

1. start = cookie.indexOf(name + "=") + name.length + 1
2. end = cookie.indexOf(";", start)
3. unescape(document.cookie.substring(start, end))

增加：

1. setDate(date.getDate() + days)
2. cookie = name + "=" + escape(value) + ((days == null) ? "" : ";expires=" +date.toGMTString())

删除：

1. date.setTime(date.getTime() - 1)
2. cookie = name + "=" + value + ";expires=" + date.toGMTString()

#### Token

#### Storage