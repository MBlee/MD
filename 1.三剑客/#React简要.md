## 简要

#### 理论

**特点**

- [虚拟DOM]()
- [声明式]()|基于[组件]()

> 支持服务器渲染，快速简单易学

**虚拟DOM**

> JS对象模拟DOM树，Diff算法=>TreeDiff=>ComponentDiff=>ElementDiff，按需更新

> [React元素]()最总会[通过虚拟DOM]()转换为真实的[DOM]()元素

> React元素[修改]()只能通过[新元素替换]()()，[并重新对根元素渲染]()
>
> 当调用render渲染页面时，React会[自动比较两次渲染的元素]()，只在真实DOM中[更新变的部分，没变的不变]()

**JSX**

- html标签小写，React组件大写开头
- 有且只有一个[根标签]()
- [表达式]()：{}（空值、布尔值、NaN、undefined不会显示）

~~~js
// 样式
<style={} className=''> 
// 条件
let ele
if(){ele = 1}else{ele = 2}
// 列表
let arr
arr.map(item=>{ele})
~~~

> 列表中key值：提高性能（默认按顺序比较，按相同key元素比较）

**路由**

HashRouter利BrowserRouter区别:

> 1. 表现层: HashRouter: # 	BrowserRouter: /
>
>    HashRouter原理是错点连接
>
>    BrowserRouter原理是H5的新特性pushState
>
>
> 2. 打包之后的上线问题HashRouter上线没有任何问题，就是ur1比较丑
>
>    BrowserRouter上线记得，一定要让后台做重定向,会出现404页面，不过这种模式要玩好，还需要后台配置支持。因为我们的应用是个单页客户端应用，如果后台没有正确的配置，当用户在浏览器直接访问 http://oursite.com/user/id 就会返回 404，这就不好看了。

## 初始化

#### 一、快速初始化

```shell
# 1.安装脚手架
npm install -g create-react-app
# 2.创建项目
create-react-app xxx
```

```shell
# router安装
npm install react-router-dom -s
# redux安装
npm install redux -s
# react-redux安装
npm install react-redux -s
```

#### 二、原始初始化

**Webpack初始化**

```shell
# 初始化目录
npm init -y
dist→src/index.html/main.js
# 安装webpack
npm i webpack webpack-cli webpack-dev-server -D
webpack-dev-server
--open --port 3000 --hot --host 127.0.0.1
# 配置webpack.config.js
mode/index.js→main.js
# html-webpack-plugin
npm i html-webpack-plugin -D
new{
	template: path.join(__dirname,"./src/index.html")
	name:"index.html"
}
```

**React初始化**

```shell
npm i react react-dom -s
```

```shell
# 创建虚拟DOM
React.createElement('',obj,children,...)
# 渲染HTML
ReactDOM.render(RD,el)
```

**JSX**

```shell
# 安装babel插件
cnpm i babel-core babel-loader babel-plugin-transform-runtime -D
cnpm i babel-preset-env babel-preset-stage-0 -D

# 安装识别jsx包
babel-preset-react -D
```

```js
// 添加.babelrc配置文件
{
"presets":["env","stage-0","react"],
"plugins":["transform-runtime"]
}
// 配置webpack.config.js
module:{
rules:[
{test:/.js|jsx$/,use:"babel-loader",exclude:/node_modules/}
]
}
// 后缀/根目录别名
resolve:{
extensions:[".js","jsx",".json"]
alias:{
"@":path.join(__dirname,"./src")
}
}
```

```shell
npm i react react-dom -s
```

```shell
# 创建虚拟DOM
React.createElement('',obj,children,...)
# 渲染HTML
ReactDOM.render(RD,el)
```
#### 版本

~~~shell
"react"："16.13.1"
"react-dom"："16.13.1"
"react-scripts"："16.13.1"
"react-redux":"7.2.8"
~~~

