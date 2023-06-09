## 基本对象

#### 字符串

~~~js
// 查位置
- indexOf, string=> -1|firstIndex
- lastIndexOf, string=> -1|lastIndex
- includes,string=> boolean
- charAt, index=> char
- search, reg=> -1|index
- match, reg/g=> null|[]
// 修改
- replace, regA|stringB
- toLowerCase|toUpperCase
- substring|slice, begin|end
- substr, begin|length
- trim()
// 拼接
- concat
- repeat
// 转换
- split(), string=> [,]
- parseInt|parseFloat, (string,redix)=>NaN|10
~~~

- **案例**


~~~js
// 删除指定字符
- str.slice(0,x)+str.slice(x+1)
- str.substring(0,str.length-1)//last
// 删除空格
- str.replace(/(^\s)|(\s$)/g,'')
- str.replace(/\s/g,'')
// 提取数字
str.replace(/[^\d]/g,'')
// 提取中文
str.replace(/[^\u4E00-\u9FA5]/,'')
// 提取英文
str.replace(/[^a-zA-Z]/g,'') 
// 去重
[...new Set(str)].join('')
~~~


#### 数学

```js
// 转为数值（全局）
- Number|parseInt|parseFloat
- String()|toString|toFixed
// 取整|绝对值
- Math.ceil|floor|round
- Math.abs
// 随机数
- Math.random(), 0-1.0
- Math.round(Math.random()), 随机0或1
// 最大最小值
- Math.max(...args)|min()
// 幂次方
- Math.pow(x,y)
// 弧度||角度
- Math.PI / 180
```

~~~js
// 非法数字
- NaN //唯一自身不全等
- isNaN()
1. typeof value === 'number' && isNaN()
2. value !== value
// 特殊数字
- MAX_VALUE|MIN_VALUE|NEGATIVE_INFINITY|POSITIVE_INFINITY
// 不同进制
- 8：0o
- 16：0x
- 2：0b
~~~

~~~js
// 随机色
`rgb(${parseInt(Math.random()*255)})`
`#${parseInt(Math.random()*0xffffff).toString(16)}`
~~~

#### 空对象

- undefined
  - typeof(obj) == "undefined"
  - obj === undefined
- !obj, null

## 引用对象

#### Promise

~~~js
// 封装异步1
Promise((resolve,reject)={resolve()})
.then{return ""|Promise.resolve("")}
.catch|finally
// 封装异步2
Promise.resolve|reject
// 多个异步
Promise.all|race
~~~

> **async** fn => Promise

> **await** promise.catch(err=>{})

#### 数组

~~~js
// 转字符串
- join()|toString()
// 生成数组
- Array()|Array.of()=>[empty]|[...args]
- Array.from(类数组|对象,v=>v)
- flat(Infinity)|flatMap
~~~

```js
// 查询有没有
arr.includes(item,fromIndex)
arr.indexOf(item)
// 查索引
arr.findIndex(item => item===xxx)
// 查值
arr.find(item => item>10)
// 查指定值
arr.filter
arr.entries|values|keys
```

~~~js
// 多数组合并
- concat
- push(...arr)|[...arr1, ...arr2]
- Array.prototype.push.apply
// 堆栈操作
- pop|push|shift|unShift
- splice|slice|fill|delete
- [index|length]
~~~

```js
// 数组乱序
arr.sort(()=>(Math.random()-0.5))
// 数据去重
- [...new Set(arr)cha]
```

#### 对象

~~~js
// 查自身属性
hasOwnProperty()
// 查键值对
Object.keys()
Object.values()
Object.entries()
~~~

~~~js
// 合并对象
Object.assign(target,...)=>target
~~~

~~~js
// 创建对象
- new Object()||{}
- Object.create(__proto_)
~~~

#### Set

> 无重复值|iterator

~~~js
new Set([])=>[...set]
// 基本操作
set.has() =>boolean
set.add()
set.delete|clear()
// 遍历
for of => [...set]
keys|values|entries
~~~

~~~js
// 数组去重
[...new Set(arr)]
// 交集
[...set1].filter(item=> set2.has[item])
// 差集
[...set1].filter(item=>!set2.has[item])
// 并集
[...set([...arr1,...arr2])]
~~~

#### Map

~~~js
map.size
// 基操
map.has()
map.get()
map.set()
map.delete|clear()
// 遍历
for of
keys|values|entries
~~~

~~~js
// Object互转
new Map(Object.entries(obj))
Object.fromEntries(map.entries)
~~~



#### 函数

#### 类型对象

~~~shell
# 通用
~~~

~~~shell
# 判断数组
- Array.isArray(x)
- Object.prototype.toString.call(x) === '[object Array]'
~~~

#### 迭代器

> Symbol.iterator().next()=>{value,done}用于for...of遍历

~~~js
// 自定义迭代器
[Symbol.iterator](){
  return {
    next(){
     return {value,done}
    }
  }
}
~~~



## 特殊对象

#### 日期

~~~js
new Date(milliseconds|[ymd,h,m,s,ms]|string)
~~~

~~~js
// 静态毫秒数
- Date.now()|UTC()
- Date.parse()
// 静态属性
- Date.prototype
~~~

~~~js
// 获取字符串
- toDateString|toTimeString
- toUTCString|toISOString
- toJSON
+ toLocaleString
+ toLocaleDateString
+ toLocaleTimeString
// 时间戳
- getTime
~~~

~~~js
// 查改
- setFullYear
- setMonth
- setDate
- getDay
- setHours
- setMinutes
- setSeconds
- setMilliseconds
~~~

#### 表单

#### 事件

mouseover，mouseenter

#### Error

> ReferenceError,TypeError,RangeError,SynTaxError

- message||stack
- try{} catch(err) {}
- throw error

## 缓存加密

#### Cookie

> 读取：document.cookie = "name=value&..."

- 非英文转换：[encodeURIComponent()]()
- 失效时间：[expires]() = date | [max-age]() = 5s|0|-1
- 域：[domain]() = xxx.com
- 路径：[path]() = /
- https：[secure]()

> 其他属性：httpOnly

**封装**

~~~js
// 设置
const set = (name,value,{maxAge,domain,path,secure}={})=>{
  let cookieText = `${encodeURIComponent(name)}=${encodeURIComponent(value)}`
  if(typeof maxAge === 'number') {
    cookieText += `; max-age=${maxAge}`
  }
  domain&&(cookieText += domain)
  path&&(cookieText += path)
  secure&&(cookieText += secure)
  document.cookie = cookieText
}
// 移除
const remove = (name,{domain,path}={}){
  set(name,"",{domain,path,maxAge:-1})  
}
// 获取
const get = name=>{
  name = encodeURIComponent(name)
  const cookies = document.cookie.split('; ')
  for(c in cookies){
    const (cname,v) = c.split('=')
    if (cname === name) 
      return decodeURIComponent(v)
  }
  return
}
~~~

> 特点：前后端都可Cookie，数量限制（清除旧）,大小（4kb）

#### Session|Token|Storage

#### MD5|Base64

#### Http