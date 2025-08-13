### TS

```shell
# Essential Check
- Debugger(SourceMap/Logpoint)
- Table/Trace() #数组对象|调用栈
- Monitor/getEventListener #监听事件|函数
- DispatchEvent(new Event({cancelable,bubble})) #模拟事件
```

```shell
# 循环引用
# 检测：
- JSON.stringify
- 递归=>self
# 解决：
- obj=null
- WeakMap|WeakSet
- 设计模式
```

```shell
# 内存泄露
```

```shell
# VSCode调试（launch.json）
- program ^ outFiles ^ preLaunchTask
- sourceMap
```

### API

```shell
#! Network
# Filter: domain|url|method...
# Ctrl+F
```

### 性能

```shell
#! 清洁环境
- 无痕模式
- clear site data
```

```shell
#! Performance
- Summary|BottomUP|CallTree
```

### !错误处理

>常见错误：
>
>JSON.parse，第三方定制
```ts
// 同步捕获
try{}
catch(err){}
finally{}
// 异步捕获
new Promise(...).catch.finally
// 错误事件
- error
- unhandledrejection
```

```ts
// 处理错误
- 非重大错误
  + 引导说明|重复操作
- 重大说明
  + 刷新页面
// 错误分析
- 工具：Sentry|Honeybadger
- 错误信息
  + 提示信息：文件名|行号|堆栈|用户|浏览器|版本信息
  + 用户历程：网页操作流程|触发事件|API历史
  + 错误属性：严重程度|次数|发生率
  + 追踪错误：发生时间|处理情况
  + SourceMap：传至服务器再映射
  + 发送错误：工具错误
```

```ts
// 抛出错误
throw new Error('')
// 自定义错误
class TrustedError extends Error{
    constructor(msg){
        super(msg)
        this.name=new.target.name
    }
}
class ApiError extends TrustedError{
    constructor(msg,status){
        super(msg)
        this.status=status
    }
}
// 错误类型
- err instanceof ApiError
```

### CSS和DOM

```shell
#! 元素状态
- forceState  #伪类
- hideElement  #隐藏H
- ctrl+\  #暂停+
#! 边框
- box-shadow
- out-line
#! 动画
- 贝塞尔
- Animations分页
```
## VSCODE

```ts
// Debug快捷键
F5（继续/暂停）F10（单个方法命令）F11（下一个方法）
Shift+F5（终止）
Ctrl+Shift+F5（重新运行）
// BreakPoint  (conditional/log/hit/trigger)
// DebugConsole
// Variables
// CallStack
```

### TS

```shell
# tsconfig.json
- sourceMap:true
- module:'commonjs'
- moduleResolution:'node'
# package.json
- main(.js)
```

```shell
# launch.json (launch/attach)(node/chrome)
- program(.ts)
- url(.html)
- file
- outFiles(**/*.js)
- preLaunchTask
- runtimeExecutable
- runtimeArgs
- address
- port
- localRoot
- remoteRoot
- processId
- skipFiles
```

```shell
# nodemon
nodemon --inspect
# launch.json
"runtimeExecutable": "npm"
"runtimeArgs": ["start"]
"outputCapture": "std"
```

### Task

### Extensions

```shell
# Console插件
- Turbo Console Log
  (ctrl+alt+L) #生成
  (shift+alt+C/U) #注释 
  (shift+alt+D) #删除
- Console Ninja
- console.(log|warn|error|info|debug)([^)]*);?\s* #正则全删
```

## DEBUG

### COSWARS

```shell
# Resolution
- 排错（亿行>亿猜）
- 错点攻破（实炼>单例）
- 替换>BYE
```