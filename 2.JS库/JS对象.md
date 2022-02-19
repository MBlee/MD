**Cookie|Session|Token|Storage**

**MD5|Base64**

**Http**

**表单**

**事件**

mouseover，mouseenter

**Websocket**

**数组**

- 多数组合并
  
  - concat
  
  - push(...arr)|[...arr1, ...arr2]
  
  - Array.prototype.push.apply

- 转字符串
  
  - toString()
  
  - join()

- 转数组
  
  - from(类数组|对象)=> 真数组
  
  - Array()|Array().of()
  
  - flat|flatMap

- 堆栈操作
  
  - pop|push|shift|unShift
  
  - splice|slice|fill|delete
  
  - [index|length]

- 查询|判断
  
  - find|findIndex|includes|indexOf
  
  - filter|entries|values|keys

**对象**

**字符串**

- 查找替换
  - replace, A|B
  - toLowerCase|toUpperCase
- 截取
  - substring|slice, 开始|结束
  - substr, 开始|个数
- 转换数
  - split(), 分割为数组
  - parseInt|parseFloat
- 索引号
  - indexOf, 第1次字符串位置(-1)
  - lastIndexOf, 最后1次字符串位置
  - search, 支持正则
- 索引字符
  - match, 正则返回数组
  - charAt, 位置字符

**数字**

- 通用
  - Number|parseInt|parseFloat
  - toString|valueOf
- 取整
  - Math.ceil, 向上
  - Math.float, 向下
  - Math.round, 四舍五入
- 随机数
  - Math.random(), 0-1.0
  - Math.round(Math.random()), 随机0或1

**空对象**

- undefined
  
  - typeof(obj) == "undefined"
  - obj === undefined

- !obj, null

**判断**

- 条件？表达1：表达2
- &&，||
- if, switch

**函数**

**作用域**

**类型对象**

**日期**

**原型继承**

**Canvas**