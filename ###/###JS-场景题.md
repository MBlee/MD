## 场景题

## 原理

### 事件循环

```ts
// 事件队列（微任务/宏任务）
- 主>微>宏>(微)>宏
// 微任务
- promise/queueMirotask
- MutationObserver
// 宏任务
- ajax
- DOM/UIRending
- setTimeout/setInterval
```