### 安装

```shell
# mockjs产生模拟数据
cnpm i mockjs -S
# json5解决json无法添加注释问题
cnpm i json5 -S
```

### 使用

<!-- 方法 -->

- **mock**
  - rurl?|rtype?
  - template|function(obj)
- **random**
  - extend({fn})
- **setup**
  - timeout, '10-100'

<!-- VUE配置 -->

```js
// devServer
if(process.env.MOCK == 'true')
- require(mock/index.js)
- before: function(app, server, compiler){
   app.get('/some/path', function(req, res){
       getJsonFile('...json5')
       res.json(Mock.mock(json))
   })
  }
// 移除Mock
env.development => MOCK=false
```

### 附录

<!-- **json5 -->

```js
// 读取
fs.readFileSync(path.join(__dirname,xxxPath),'utf-8'))
// 解析
JSON5.parse(json5)
```

<!-- Mock语法 -->

```shell
# 数据模板  'name|rule': value
- string, min-max|count
- number, min-max|min-max.dmin-dmax|+1
- boolean, min-max|1
- object, min-max|count
- array, 1|+1|min-max|count
- function|regexp
# 数据占位符  @占位符 Mock.Random.extend()
- boolean, min?|max?|current?
- natural|integer|float, min?|max?|dmin|dmax
- character|string, lower|upper|number|symbol,min?|max?
- range, start|stop?|step?
+ date|time|datetime|now, y-M-d|H-m-s-ss-SS|t|A|a
+ image|dataImage, size?|background?|foreground?|format?|text?
+ color|hex|rgb|rgba|hsl
+ title|ctitle|paragraph|sentence|csentence|word|cword, pool?|min?|max?
+ first|last|name|cfirst|clast|cname|cword
+ url|protocol|domain|tld|email|ip, protocol?|host?
+ region|province|city|county|zip, true?
+ pick|shuffle, arr
+ guid|id|increment, step?
```
