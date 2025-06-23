## 核心

> app

~~~js
app.whenReady().then()
app.quit()
app.on('ready')
app.on('activate')
app.on('window-all-closed')
app.on('before-quit')('will-quit')('quit')
// DOM事件
window.onbeforeunload=_=>{ BWindow.destroy() return false }
~~~

> BrowserWindow

```js
// BrowserWindow(remote.BrowserWindow||remote.getCurrentWindow())
new BrowserWindow({
width,height,resizable,show
title,icon,frame,autoHideMenuBar
parent:remote.getCurrentWindow()
modal:true
webPreferences:{
  preload,
  nodeIntegration,contextIsolation,
  enableRemoteModule
})
BWindow.loadFile('.html')
BWindow.show()
BWindow.close()
BWindow.maximize() | ismaximizable()
BWindow.minimize() | isminimizable()
BWindow.restore() | destroy()
BWindow.on('ready-to-show',()=>{ BWindow.show() })
BWindow.on('close',_=>{BWindow=null})
Bwindow.webContents.on('dom-ready')
Bwindow.webContents.on('did-finish-load')
```

> Menu

```js
const opts = [
    {
        label:'file'
        submenu:[
        	{
        		label:'open',
        		click(){ ... }
            },{
                type:'separator'
            },{
                label:'about',
                role:'about'
            }

        ]
    }
]
const menu = Menu.buildFromTemplate(opts)
Menu.setApplicationMenu(menu)
```

## API

~~~js
// 文件写入
fs.writeFile(xxpath,xxcontent,(err)=>{})
// 文件拖入
ele=>('drop',e.dataTransfer.files[path])
ele=>('dragover')
e.preventDefault()&&e.stopPropagation()
~~~

## Preload

```ts
// contextBridge
const {contextBridge} = require('electron')
contextBridge.exposeInMainWorld('glb',{node,...})
const win = new BrowserWindow({webPreferences.preload})
window.node()...
// IPC
const {ipcRenderer,ipcMain} = require('electron')
ipcRenderer.invoke('ping')
ipcMain.handle('ping',fn)
```

## ...

## Construction

> 快速启动：nodemon --watch main.js --exec npm run build 

```shell
# 克隆模板
git clone https://github.com/electron/electron-quick-start
# 脚手架: create-electron-app
yarn create electron-app xxx
npx create-electron-app xxx
```

```shell
# 原理
主进程（原生API）<=>渲染进程（Chromium + nodejs）
```

```shell
# npm: electron
npm i electron -D
electron .
# npm: @electron-forge/cli
npm i @electron-forge/cli -g
electron-forge import
electron-forge start
electron-forge package
electron-forge make
```

### Electron Forge

### Electron Fiddle

## Debug

### VSCode

```json
// launch.json
{
  "version": "0.2.0",
  "compounds": [
    {
      "name": "Main + renderer",
      "configurations": ["Main", "Renderer"],
      "stopAll": true
    }
  ],
  "configurations": [
    {
      "name": "Renderer",
      "port": 9222,
      "request": "attach",
      "type": "chrome",
      "webRoot": "${workspaceFolder}"
    },
    {
      "name": "Main",
      "type": "node",
      "request": "launch",
      "cwd": "${workspaceFolder}",
      "runtimeExecutable": "${workspaceFolder}/node_modules/.bin/electron",
      "windows": {
        "runtimeExecutable": "${workspaceFolder}/node_modules/.bin/electron.cmd"
      },
      "args": [".", "--remote-debugging-port=9222"],
      "outputCapture": "std",
      "console": "integratedTerminal"
    }
  ]
}
```

## Appendix

#### 自定义标题无法拖拽

> -webkit-app-region: drag || no-drag;

