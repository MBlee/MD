# 布局

**Rem|百分比**

- clientwidth
- fontsize=(cw*(10/320)>40)

flexible|cssrem|postcss-px2rem

### CSS动画

CSS属性的变化（简单流畅-减少代码量）

:hover, :active, :focus

**transition动画**

property，duration，timing-function，delay

**transform**

translate(x, y)，scale(x,y)

rotate(45deg)，skew(-45deg,y)

perspective(n)

### 布局基础

**清除浮动**

1. :after

   content, display, clear

   visibility

2. overflow

**BFC**

块级格式化上下文，独立的渲染区域，内部元素渲染不影响外界

形成：

- 浮动元素（！none）
- 绝对定位元素（absolute|fixed）
- 块级元素overflow（！visible）
- flex元素
- inline-block元素

应用：

- 清除浮动

**外边距塌陷**

形成：

- 上下margin取最大
- 父子margin取最大（父无上内及边框）
- 空margin合并

解决：

1. 只设置一个margin
2. 设置内边|BFC

### JS定位

**offset**

offsetTop, offsetHeight(padding+content+border), offsetParent

**client**

clientWidth(padding+content)

**scroll**

- scrollTop, scrollHeight(padding+content)

- onscroll

(window.pageXOffset|documentElement|body)

- scrollTo()|scroll(), scrollBy()

**Mouse**

offsetY, pageY, clientY, screenY

# ES6新增

### ES新增特性

**let|const**

- 变量提升|块级作用域
- 同一作用域不能同名

const

- 声明必须赋值
- 不可改且但引用类型可改

**箭头函数**

- 简洁：(,)=>(obj)
- this=最近作用域
- 不能做构造函数|没有arguments参数

**模板字符串**

`和${变量|表达式|计算|函数}

**属性方法简写**

**剩余参数**

fn(...args), 只能有一个，必须最后一个

**扩展运算符|解构赋值**

- 函数调用
- 数组|对象

**Symbol类型**

- Symbol()作为对象属性名
- 定义类的私有属性|方法

getOwnPropertySymbols|getOwnPropertyNames

**Class类支持**

**模块Import，export**

### 数组新增方法

**filter**

- 返回符合条件的新数组

**some|every**

- 判断有一个符合条件|true

- 判断所有元素都符合条件|true

**map**

- 返回一个新数组

**from**

- Array.from(类数组|对象)=>真数组

**of**

- 将一组值转为数组|Array().of()|Array()

**entries|values|keys**

- 返回迭代器|键值对

- 返回键值对|value
- 返回键值对|key

**flat|flatMap**

- 返回一维新数组
- 只展开一层数组

**fill**

- arr.fill(value, start, end)，填充替换

**copyWithin**

- arr.copyWithin(target, start, end)，复制

**find，findIndex，includes**

1. 找到第1个元素，返回并终止
2. 找到第1个元素下标，返回并终止
3. 判断元素是否存在|indexOf(NaN)

### 浅拷贝Assgin方法

用于对象合并，将源对象所有枚举属性复制到目标对象

- 浅复制（源对象属性为对象）
- 为对象添加属性|方法
- 合并多个对象

### Set集合和map集合

1. 无重复值有序列表（Object.is）
   - set.size, has(), add(), delete(), clear(), forEach(callback, this)
   - 转换为数组，[...arr] = set
2. 无重复值键值对（Object.is）
   - map.set(), get(), has(), add(), delete(), clear() ,size, forEach(callback, this)

# JS核心

### 预编译

前奏：生成GO对象

四部曲：

1. 创建AO对象
2. 找形参和变量声明，将变量和形参名作为AO属性名，值为undefined
3. 将实参值和形参统一
4. 在函数体找函数声明，值赋予函数体

函数提升，变量提升（先存储，再执行）

### 运行机制

单线程，用户互动、操作DOM

### 同步异步

同步：主执行栈

异步：任务队列（消息队列），回调函数

异步事件：IO设备、用户事件、定时器事件、Promise

### 事件循环

主→消息队列

### 作用域

全局：1.全局声明的变量 2.未声明但赋值的变量

函数：函数中变量

块级：

作用域链：局部查找 => 上一级

### 闭包

访问函数作用域变量的函数，重复使用变量

缺点：闭包会常驻内存，导致内存溢出（闭包结束删除变量）

应用：

1. 封装属性和方法
2. 函数作为参数，返回值
3. 防抖，节流

### 深浅拷贝

浅拷贝：

1. ObjectAssign
2. 扩展运算符

深拷贝：

1. JSON
2. 

### 原型链

对象，构造函数原型，自身查找该属性，逐级向上，Object，没有就是unfined

### 对象

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

### HTTP|TCP

网络通讯分层

3次握手：发送→接受→发送确认

### 前端攻击

**XSS**

攻击：

反射型，输入提交到服务器，解析后xss代码到浏览器，浏览器执行。

存储型，存储到服务器，加载执行代码。

防御：

1. 对用户输入处理HTMLEntity编码
2. 正则过滤，过滤不安全内容|DOM属性|Script

CSRF

SQL

### SEO优化

**vue-meta-info**

- metaInfo.meta
  - title|titleTemplate
  - description
  - keyword
  - robots

**prerender-spa-plugin**

**nuxt.js**

- 基于vue的SSR服务器渲染框架，把vue渲染成html给浏览器

**react-snap**

### JS与原生交互

### 浏览器缓存

### Vue|React优缺点

### Vue2|Vue3

### 数组

### 对象
