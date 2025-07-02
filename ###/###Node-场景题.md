##Node

对 Node 的思想一切皆异步的理解

```ts
//所有的 I/O 操作都是异步的
- 文件 、网络、数据库、控制台
```
1. node 中的 exports 如何实现的，它和 module.exports 有什么关系

2. Node.js 加载模块机制

3. Node.js 的适用场景

4. 原生 Node 如何解决跨域

5. 反向代理是什么，如何实现

6. common.js和es6中模块引入的区别

7. 为什么Node在使用es module时必须加上文件扩展名

8. 浏览器和 Node 中的事件循环有什么区别

9. Node性能如何进行监控以及优化

10. 如果让你来设计一个分页功能,你会怎么设计前后端如何交互

11. 如何实现文件上传说说你的思路

12. 如何实现iwt鉴权机制说说你的思路

13. 说说对中间件概念的理解，如何封装 node 中间件

14. 说说 Node 文件査找的优先级以及 Require 方法的文件查找策略

15. 说说对Nodejs中的事件循环机制理解

16. 说说Node中的EventEmitter如何实现-个EventEmitter

17. 说说对 Node 中的 stream 的理解应用场景

18. 说说对 Node 中的 Buffer 的理解应用场景

19. 说说对 Node 中的 fs模块的理解有哪些常用方法

20. 说说对 Node 中的 process 的理解有哪些常用方法

21. 解释一下Node.js的事件循环（Event Loop）机制。

22. Node.js中宏任务和微任务的分类和执行顺序

    事件循环中的生产者/消费者模型

    ```shell
    # 事件循环（消费者），异步IO（生产者），多线程（线程池）
    ```

    Node.js三种模块及require()加载原理

    ```shell
    # core-node_modules-main/index/.js/.json
    ```

    require和import的区别

    ```shell
    # require(动态/运行时)，import(静态/编译时)
    ```

23. 什么是Cluster模块如何在Node.js中实现多进程集群

    简述 Node. js 基础概念 

    ```shell
    # 单线程-事件驱动-非阻塞IO
    ```

24. 什么是事件驱动编程和非阻塞I/ONode.js如何实现非阻塞I/O

    简述Node.js 技术架构 

    ```shell
    # V8引擎-Libuv库-内置库
    ```

    简述Node.JS的异步I/O原理

    ```shell
    # 非阻塞IO(libuv)-事件驱动-事件循环
    ```

    简述Node. js有哪些全局对象

    ```shell
    # global,process,Buffer,__filename,__dirname
    ```

25. 简述Node中的process的理解，有哪些常用的方法 

26. 简述Node中的fs模块的理解

27. 有哪些常用的方法描述Node中的Stream的理解应用场景

28. 简述Node文件查找的优先级以及require方式的文件查找策略 

29. 文件查找优先级require方式的文件查找策略

30. 简述Node.js有哪些定时功能

31. 请描述Node. js中的事件循环 

32. 如何应用 Node. js中的 Buffer

33. 简述Node. js中的异步和同步如何理解

34. Node.js通过哪些方法可以进行异步流程的控制

35. Node.js 通过哪些常用方法可以防止程序崩溃

36. 简述如何怎样调试 Node. js程序

37. 简述Node .js的网络模块都有哪些

38. 简述Node.js是怎样支持 HTTPS、TLS 的

39. 简述Node.js的npm原理和机制 

40. 简述Node.js npm的包和模块的关系

41. 解释Node. js中导入模块和导入

42. 简述什么是 EventEmitter

43. 如何实现一个 EventEmitter

44. 简述Node EventEmitter有哪些典型应用

45. 如何捕获 EventEmitter的错误事件

46. Node有哪些常用 Stream流分别什么时候使用

47. 使用代码简述如何实现一个 Writable流

48. 简述内置的fs模块架构由哪几部分组成

49. Node如何读取JSON配置文件

50. 简述fs.watch和 fs.watchFile有什么区别

51. 简述Node为什么需要子进程

52. Node中exec、 execFile、 spawn和fork都是做什么用的

53. Node 如何实现一个简单的命令行交互程序

54. 思考解释两个 Node. js程序之间如何交互

55. 简述如何让一个 JavaScript文件变得像 Linux命令一样可执行

56. Node子进程和进程的 stdin、 stdout、 stderror是同样的吗

57. 简述什么是Node.js REPL(交互式解释器) 

58. Node.js 中有多少种 API 函数 

59. Node使用 Promise 代替回调有什么好处 

60. 简述Node可以使用哪些工具来确保代码风格一致 

61. 浅谈什么是回调地狱

62. 如何有效避免回调地狱

63. 简述什么是stub举例说明

64. 解释如何用Node监听80端口 

65. NodeJS的单线程模型

66. 解释Node module.exports的用途

67. 简述Node.js中的Reactor Pattern有什么理解

68. 解释Node.js 的 LTS 版本是什么

69. 解释什么是Node的ibuv 

70. 解释Node中解释URL模块的概念

71. 解释对ESLint的理解是什么

72. 解释列出 async.queue 作为输入的两个参数

73. 解释Node.js 中 spawn() 和 fork() 方法的区别

74. 简述断言在NodeJS中如何工作 

75. 综合解释定义测试金字塔的概念。从 HTTP API 的角度解释实现它们的过程 

76. 简述process.nextTick() 和 setImmediate() 的区别

77. 相对，固定，绝对和静态定位的元素有什么区别

78. 解释NODE_ENV有什么用

79. Node.js 中 readFile 和 createReadStream 的区别

80. 列出 Node.js 的各种计时功能

81. 解释解释Node.js中Punycode的概念 

82. 描述 Node.js 的退出代码

83. Node.js 支持密码学吗

84. 简述如何监控Node.js应用程序 

    如何判断当前脚本运行在浏览器还是 node 环境中

    ```ts
    //（检查全局对象，window，global）
    if(window!='undefined')
    if(process!='undefined'&&process.release.name=='node')
    ```

## Socket

## Libs

1. 简述Node express项目的目录大致是什么结构的

2. 简述Node express常用函数有哪些

3. Node express中如何获取路由的参数

4. 简述express response有哪些常用方法

5. 解释一下ExpressJS包的用途

6. 解释为什么 Express ‘app’ 和 ‘server’ 必须分开的原因

   什么是中间件（Middleware）

   ```shell
   # HTTP请求/响应前处理(数据解析、身份认证、日志记录)
   ```

   在Express中如何使用中间件

   ```shell
   # request/response/next
   ```

   介绍一下Koa的洋葱模型

   ```shell
   # 请求=>中间件顺序(next)=>中间件逆序=>响应
   ```

7. 实现koa的compose函数


