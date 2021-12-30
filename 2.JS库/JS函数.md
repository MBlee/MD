### 高阶函数

函数参数|返回值是函数

应用：

~~~js
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
~~~

### 附录

<!-- 基础语法 -->

~~~js
// 声明 1.声明式 2.变量赋值式 3.自执行|运算符
- function(...args){ return }
- var fn = function(){return arguments}
(function(){return})()
// 参数
+ arguments.length|callee
~~~

