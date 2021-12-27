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

