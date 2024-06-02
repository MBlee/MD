## 理论

#### React特点

```shell
# 组件化
# 虚拟DOM
- JSX
- diff
# 单向数据流
```

```shell
# 快速响应
- IO卡顿 ErrorBoundary
- CPU卡顿 60HZ
# 时间切片
- 同步阻塞渲染
- 异步非阻塞 用户优先级渲染
(concurrent mode)
(5ms 保存执行上下文)
# React15
- reconciler 协调器 diff
 update=>render jsx=>vdom diff=>renderer渲染
- renderer 渲染器 diff渲染
 ReactDOM跨平台
- 递归更新子组件 mount update
```

## 原理

## 项目