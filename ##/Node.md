# 原理

#### Essential-单线程

```shell
# 调用栈（帧）
- 函数调用另一个函数，向调用栈添加帧(Node:v14最大调用栈超过15000帧)
- 递归无退出：Maximum call stack size exceeded error
- 异步：新执行栈函数，同步：同一执行栈另一函数
- 不执行任何异步操作的应用会执行栈结束退出，保持进程活跃：.unref()和.ref()
# 事件循环（多调用栈）
- 很长时间的函数会阻塞事件循环
```

```shell
# C++底层
- libuv: 处理系统抽象和I/O、crypto、zlib等CPU密集型操作
	- 维护线程池（4~1024），UV_THREAD-POOL_SIZE=<threads>
- V8、OpenSSL、第三方模块
- Nodebinding
# JS
- 核心API、userland
```

#### Essential-事件循环

```shell
# 微任务
- process.nextTick()
- Promise.resolve()|reject().then()
# 轮询阶段
- I/O回调
# 检查阶段
- setImmediate()
# 关闭阶段
- EventEmitter=>close|net.Sever=>close
# 定时器
- setTimeout()|setInterval()
# 挂起
- net.Socket=> ECONNERFUSED
```

# 面试

```ts
// JS执行时间（B 1, E 501, A 502, D 502, C 502）
setTimeout(()=>console.log('A'),0)
console.log('B')
setTimeout(()=>console.log('C'),100)
setTimeout(()=>console.log('D'),0)
let i=0
while(i<1000000000){ 
  let ignore=Math.sqrt(i)
  i++
}
console.log('E')
// 事件循环（8、3、2、1、4、7、6、5）
const fs =require('fs')
setImmediate(()=>console.log(1))
Promise.resolve().then(()=>console.log(2))
process.nextTick(()=>console.log(3))
fs.readFile(__filename,()=>{
  console.log(4)
  setTimeout(()=>console.log(5))
  setImmediate(()=>console.log(6))
  process.nextTick(()=>console.log(7))
})
console.log(8)
// 事件循环（2、1、4、3、6、8、5、7）
const sleep_st = (t)=>new Promise(r=>setTimeout(r,t))
const sleep_im = ()=>new Promise(r=>setTimmediate(r))
(async ()=>{
  setImmediate(()=>console.log(1))
  console.log(2)
  await sleep_st(0)
  setImmediate(()=>console.log(3))
  console.log(4)
  await sleep_im()
  setImmediate(()=>console.log(5))
  console.log(6)
  await 1
  setImmediate(()=>console.log(7))
  console.log(8)
})()
```

