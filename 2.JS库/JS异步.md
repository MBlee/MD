#### API

```js
// 下一帧执行
requestAnimationFrame(callback)
// 空闲执行
requestIdleCallback((deadline)=>{
    deadline.didTimeout
    deadline.timeRemaining()
},{timeout})
```

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

```js
// 延时函数
const delay = (interval)=>{
    typeof interval !== 'number'? interval = 1000 : null
    return new Promise(res=>{
        setTimeout(()=>{
            res()
        },interval)
    })
}
```

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

#### 生成器

> function *gen() => generator() =>iterator

> iterator.next(pre) = yield <res>

