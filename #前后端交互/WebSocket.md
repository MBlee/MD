### H5-Websocket

ws://echo.websocket.org

- new WebSocket(xxxWs)

- Socket.send|close()

- addEventListener
  
  - open|error|close
  - message

### NodeJS-Websocket

```shell
# nodejs-websocket安装
cnpm i nodejs-websocket
```

```js
// 创建Server
ws.createServer(connect=>{"用户连接"
    connect.on("text",data=>{
        connect.send(data)
    })
    connect.on("close",data=>{
        "连接断开"
    })
    connect.on("error",data=>{
        "连接异常"
    })
})
server.listen(8000,()=>{"服务启动成功，监听了8000"})
```

### Socket.IO

```js
// 创建服务器
require('socket.io')(app)
// 监听事件
io.on('connection', socket=>{
    // socket.emit触发事件
    socket.emit('send',{name:''})
    // socket.on注册事件
    socket.on('send',data=>{})
})
```

```js
<script src="/socket.io/socket.io.js"></script>
socket = io('socketUrl')
socket.on('send',data=>{})
```

#### 简单聊天室

```js
// NodeJS
+ connect.xxx = xxx
+ server.connections.forEach(connect=>connect.send(data))
// H5
+ click => socket.send()
+ message => appendChild
```
