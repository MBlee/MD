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

## ...

## 构建

> 快速启动：nodemon --watch main.js --exec npm run build 

~~~shell
# 克隆模板
git clone https://github.com/electron/electron-quick-start
# 脚手架: create-electron-app
yarn create electron-app xxx
npx create-electron-app xxx
# 手动
npm i electron -g
yarn add electron
# yarn构建
yarn start
yarn make
~~~

```shell
# 原理
主进程（原生API）<=>渲染进程（Chromium + nodejs）
```

## 附录

#### 自定义标题无法拖拽

> -webkit-app-region: drag || no-drag;

