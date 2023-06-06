## 函数编程

#### 高阶函数

函数参数|返回值是函数

```js
// 抽取Fn
Function.prototype.before = function(beforeFn){
    return (...args)=>{
        beforeFn()// 额外的
        this(...args)// 执行核心
    }
}
// 核心Fn
let newFn = coreFn.before(()=>{})
newFn(1,2,3)
```

#### 函数柯里化

~~~js
// 把1个函数转为n个函数（根据参数个数）
function curring(fn){
  let args = []
  const inner = (arr=[])=>{
    args.push(...arr)
    return args.length >= fn.length?fn(...args):(...args)=>inner(args)
  }
  return inner()
}
~~~

#### 递归函数

~~~js
// 递归阶乘
function factorial(num){
  return num == 1 ? 1 : num*factorial(num-1)
}
// 递归求和
function sum(...args){
  return args == [] ? 0 : args.pop()+sum(...args)
}
// 倒三角
function star(sum){
  return sum ? document.write('*'.repeat(sum)+'<br/>')||star(--sum):''
}
~~~

#### 异步函数

~~~js
// 回调函数
function finish(){
  if(data)=>{}
}
// 高阶函数
function after(cb){
  let data
  return funtion finish(){
    cb(data)
  }
}
~~~

## 对象编程

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

~~~js
- async fn // 返回Promise
- await promise // 返回异步结果
- for await（ of ）|for
~~~

~~~shell
# 兼容：Babel转译器
~~~

#### 原型链

```js
// 对象属性查找规则
1.读取属性，查找原型链
2.设置属性，新增不查找
// 属性检测
- a in as //原型链
- hasOwnProperty('') //本身

// 原型链设置|获取
- Object.getPrototypeOf|setPrototypeOf
- xx.Prototype = yy
+ Object.create
// 构造函数设置|获取
- Object.getPrototypeOf(obj).constructor
// 原型链判断
+ obj1.isPrototypeOf(obj2)|a instanceOf b

// 非原型链
- xxx.apply|call
```

> 无原型对象：Object.create(null , {})

> 顶层对象：Object.prototype

#### 继承

```js
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
```

#### Class

~~~js
// 继承
- class cls extends superClass
- constructor(props){ super(props) }
// 静态属性 
- static x|x()
// 私有属性
- _x|symbol()
- #x|#x=>{}
~~~

## 附录

> 核心

~~~js
// 声明 
- function
- let fn = function
- let obj = {fn:function}
(function(){})(window)
~~~

```js
// 参数
+ arguments.length|callee
// this 
- 调用对象
- 方法→对象
- 函数→window（const self）
- 箭头→父级作用域
// this指向，复用函数
- apply(this,[])
- call(this,...)
- bind(this,...)
+ Math.max.apply(Math,arr)
```

> 闭包

> 箭头函数

> 构造函数

#### For循环

```js
// for循环
for(let i,xx; xx=xxs[i++];)
for(const i in arr|obj)
for(const i of arr)
- arr.forEach((item,index,arr)=>{})
- arr.map((item,index,arr)=>{})

// while循环
- while(false){}
- do{}while(false)
```

```shell
# 内部核心
- label:for() => break|continue
```

```shell
# for in
- 遍历prototype|obj
- 可以break
# for of
- 遍历arr|类数组|map|set|str
- 可以break
# forEach和map
1.forEach|map锁定数组。map返回新数组
2.无法break
```

#### If判断

```js
// switch
switch(n){case n: ... break;}
// 短路表达式
a && a=[](true)
a || a=[](false)
```

```js
// 类型判断
- Object.prototype.toString
- typeof
- instanceOf|isPrototypeOf|constructor
// 属性判断
- obj.hasOwnProperty('') //自身属性
- key in obj //继承属性
- obj.key||(obj.key !==undefined) //不识别undefined
```
