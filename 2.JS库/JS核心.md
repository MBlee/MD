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

### 函数

### 继承

### 发布订阅

创建发布订阅类

- constructor > this.$pond = [], 创建事件池

- add(func), 追加（重复处理）

  - this.$pond.some(return item === func)
  - this.$pond.push(func)

- remove(func),  移除

  - for > if($pond[i] === func)
  - $pond.splice(i, 1) > break, 数组塌陷
  - $pond[i] = null

- fire(...args), 通知

  - for > if(typeof item !== 'function')

    $pond.splice(i, 1), i-- ,continue

  - item.call(this, ...args)

### 缓存策略

### Promise

Promise((resolve,reject)={

​	resolve()

}).then{

​	return ""|Promise.resolve("")

}.catch

Promise.all

### Reduce

### HTTP协议

### call | apply | bind

- call | apply ，改变this并调用

  call(obj , args... )

  apply(obj, arg[] )

- bind, 只改变this

  bind(bind, args... )
  
  调用时，按形参顺序执行
  
  