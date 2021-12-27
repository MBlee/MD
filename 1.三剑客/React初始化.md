## 一、快速初始化

~~~shell
# 1.安装脚手架
npm install -g create-react-app
# 2.创建项目
create-react-app xxx
~~~

~~~shell
# router安装
npm install react-router-dom -s
# redux安装
npm install redux -s
# react-redux安装
npm install react-redux -s
~~~



## 二、原始初始化

### Webpack初始化

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

### React初始化

~~~shell
npm i react react-dom -s
~~~

```shell
# 创建虚拟DOM
React.createElement('',obj,children,...)
# 渲染HTML
ReactDOM.render(RD,el)
```

### JSX

```shell
# 安装babel插件
cnpm i babel-core babel-loader babel-plugin-transform-runtime -D
cnpm i babel-preset-env babel-preset-stage-0 -D

# 安装识别jsx包
babel-preset-react -D
```

~~~js
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
~~~
