[技术栈：Electron, Node.js (SerialPort), MQTT, SQLite]()

## Situation

- ​

## Task

- 开发了一个跨平台的 Node.js 桌面中间件，用于连接后厨的各种硬件（蓝牙秤、标签机）。

## Action

- 利用 Node.js 的 **WorkerThreads** 处理硬件心跳检测与协议解析，确保不阻塞UI 渲染主线程。

## Quote

```shell
# 参考网站
https://www.njxwst.com/html/solution/224.html
https://www.yixinfa.com/
```