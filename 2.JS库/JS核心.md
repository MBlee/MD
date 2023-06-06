#### 内存管理

```shell
# 1.申请内存	2.使用	3.释放内存
var obj = {}
obj.name = 'lee'
obj = null
# 垃圾回收 => 释放内存(GC)
1. 不再被引用
2. 不能从根上访问
# 可达对象：1.可访问（引用、作用域链）	2.可被找到(从根出发)
```

~~~shell
# 引用计数
~~~

#### 预编译

前奏：生成GO对象

四部曲：

1. 创建AO对象
2. 找形参和变量声明，将变量和形参名作为AO属性名，值为undefined
3. 将实参值和形参统一
4. 在函数体找函数声明，值赋予函数体

函数提升，变量提升（先存储，再执行）

#### 运行机制

单线程，用户互动、操作DOM

#### 同步异步

同步：主执行栈

异步：任务队列（消息队列），回调函数

异步事件：IO设备、用户事件、定时器事件、Promise

#### 事件流

1.捕获阶段

2.当前目标

3.冒泡阶段

#### 事件循环

主→消息队列

#### 作用域

全局：1.全局声明的变量 2.未声明但赋值的变量

函数：function	块级：{}

~~~shell
# 内部原理
1.编译 #分词（词法单元）,解析（AST），生成可执行代码
2.执行 #查找当前作用域（向上），有（执行），无（抛异常）
3.查询 #LHS(赋值)||RHS(引用)
4.嵌套 #当前→外层嵌套→全局
5.异常 #'use strict'
# 词法作用域||遮蔽
# 变量提升||函数提升
# 执行环境||执行流||执行环境栈
~~~

> 作用域链：当前→外层嵌套→全局(抛出异常)

> 同一作用域：1.先变量后函数
>
> 2.变量重复声明无用，函数声明会覆盖前面的声明

#### 闭包

访问函数作用域变量的函数，重复使用变量

缺点：闭包会常驻内存，导致内存溢出（闭包结束删除变量）

应用：

1. 封装属性和方法
2. 函数作为参数，返回值
3. 防抖，节流

#### 深浅拷贝

浅拷贝：

1. ObjectAssign
2. 扩展运算符

深拷贝：

1. JSON
2. 递归

~~~js
function deepClone(obj){
  if(typeof obj !== 'object' || obj == null){return obj}
  let result
  if(obj instanceof Array){result=[]}
  else(result={})
  for(let key in obj){result[key]=deepClone(obj[key])}
  return result
}
~~~



#### 面向对象

~~~js
// 创建对象
1.{} new Object()
2.工厂函数|构造函数
~~~

#### 原型链

~~~js
// 对象属性查找规则
1.读取属性，查找原型链
2.设置属性，新增不查找
// 属性检测
- a in as
- as hasOwnProperty (for in)
// 原型链设置|获取
- Object.getPrototypeOf|setPrototypeOf
- Object.create
- xx.Prototype = yy
- Object.isPrototypeOf|instanceOf
// 非原型链
- xxx.apply|call
~~~

#### 继承

~~~js
// 改变构造函数的原型不是继承
// 继承是原型的继承
1.XX.prototype.__proto__ = Y.prototype
2.XX.prototype = Object.create(Y.prototype)
  XX.prototype.constructor = YY
Object.defineProperty(XX.prototype,"constructor",{
	value:Admin, enumerable:false  
})
// 属性继承
XX(...args){ YY.apply(this,args) }
// 多态,多对象继承同一个原型
// 同一方法不同实现
// 多继承，mixin|super|链式继承
XX.prototype = Object.assign(YY.prototype, ...)
~~~

#### Class

~~~js
class cls extends superClass{
    constructor(props){
          super(props)
          this.state/this.method
    }
    get|set xxx(){}
	static x|x();
	_xxx;
}
~~~

#### This

默认：调用者

箭头函数：当前作用域This

#### 函数

#### 发布订阅

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

#### 缓存策略

#### Promise

Promise((resolve,reject)={

​    resolve()

}).then{

​    return ""|Promise.resolve("")

}.catch

Promise.all

#### Reduce

#### HTTP协议

#### call | apply | bind

- call | apply ，改变this并调用

  call(obj , args... )

  apply(obj, arg[] )

- bind, 只改变this

  bind(bind, args... )

  调用时，按形参顺序执行


#### SEO

关键词选取 > 索引规则 > 提升网站排名 > 获得精准流量