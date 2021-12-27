## 通用打包

~~~shell
#初始化
npm init -y
npm i webpack webpack-cli -D
#打包
webpack src -o build --mode development/production
# 自带插件
# BannerPlugin
new webpack.BannerPlugin()
~~~

~~~js
//打包配置
//webpack.config.js
module.exports={
    mode:'develepment',
    entry:'obj/arr/str',
    output:{
        filename:'[name].js',
        path:'resolve(__dirname,'build')'
    },
    module:{
        rules:[]
    },
    plugins:[]
}
//ES6转ES5
//npm i -D babel-loader @babel/core @babel/preset-env webpack

{
    test:/\.m?js$/,
    exclude:/(node_modules|bower_components)/,
    use:{
        loader:'babel-loader',
        options:{
            presets:['@babel/preset-env']
        }
    }
}
//Eslint
//npm i eslint eslint-loader eslint-config-airbnb-base eslint-plugin-import -D
//package.json中加入
'eslintConfig':{
    'extends':'airbnb-base'
}
//webpack.config.js加入
{
    test:/\.js$\,
    exclude:/node_modules/,
    loader:'eslint-loader',
    options:{
        fix:true
    }
}
//js文件加入
//下一行eslint所有规则失效
//eslint-disable-next-line
~~~

```js
//打包HTML
//npm i html-webpack-plugin -D
new HTMLWebpackPlugin({
    template:'src.html',
    filename:'build.html',
    chunks:[],
    minify:{
        collapseWhitespace:true,
        removeComments:true
    }
})
// 压缩HTML
// uglifyjs-webpack-plugin@1.1.1 --save-dev
new uglifyjsPlugin()
```

~~~js
//打包Css
//npm i css-loader style-loader -D
//npm i less less-loader node-sass sass-loader -D
{
    test:/\.(css|less|scss)$/,
    use:['style-loader','css-loader','less-loader']
}
//提取CSS文件
//npm i mini-css-extract-plugin -D
new miniCssExtractPlugin()
{
    test:/\.(css|less|scss)$/,
    use:[miniCssExtractPlugin.loader,'css-loader','less-loader']
}
//Css模块化
{
	test:/\.css$/,
	use :['style-loader','css-loader?modulesbuildpath][name]-[local]-[hash:5]']
}
//Css压缩
//npm i optimize-css-assets-webpack-plugin -D
optimization:{
    minimize:true,
    minimizer:[
        new terserWebpackPlugin
        new optimizeCssAssetsWebpackPlugin
    ]
}
//Css兼容性
//npm i postcss-loader postcss-preset-env -D
{
    test:/\.(css|less|scss)$/,
    use:[miniCssExtractPlugin.loader,'css-loader','less-loader','postcss-loader']
}
//postcss.config.js
{
    plugins:[require('postcss-preset-env')()]
}
// package.json
'browserslist':[
    "ios >= 6",
    '>1%',
    'last 2 sversions',
    'not dead'
]

~~~

~~~js
//打包图片
//npm i url-loader file-loader -D
{
    test:/\.(png|jpg|gif)$/,
    use:[
        loader:'url-loader',
        option:{
        	publicPath:'./images/',
        	outputPath:'images/',
        	name:'[name][hash:8].[ext]',
        	limit:1024*8,
        	esModule:false
        }
    ],
    type:'javascript/auto'
}
//npm i html-loader -D
{
    test:/\.html$/,
    loader:'html-loader',
    options:{
        esModule:false
    }
}
~~~

~~~js
//打包其他资源
{
    exclude:/\.(js|json|html|css|less|scss|png|gif|jpg|jpeg)$/,
    loader:'file-loader',
    options:{
        publicPath:'./font/',
        outputPath:'font/',
        name:'[name][hash:8].[ext]'
    }
}
~~~

~~~shell
# 开发服务器
# npm i webpack-dev-server@2.9.1 -D
webpack serve --port 3000
# webpack.config.js
target:'web'
devServer:{
	port:3001,
	compress:true,
	open:true,
	hot:true
}
# packge.json
'scripts':{
	'dev':'webpack serve --port 3000'
}
~~~

~~~shell
# 环境优化

# HMR模块热替换
devServer:{
	hot:true
}
1. 样式HMR功能，在开发环境使用Style-loader
2. html，需要在entry入口引入html文件
3. js，只能处理非入口文件的JS文件
module.hot接口暴露在index.js中
if(module.hot){
    module.hot.accept('./print.js',function(){
    	#服务器检测到print变化中，执行这个函数
    })
}

# 去除死代码
# 去JS
# tree-shaking去除无用js，1.必须ES6模块化 2.开启Production
# 去CSS
# purgecss-webpack-plugin去除无用Css
const {resolve,join} = require('path')
const purgecssWebpackPlugin
const glob = require('glob')
const PATHS = {src:join(__dirname,'src')}
new PurgecssPlugin({
	paths:glob.sync(`${PATHS.src}/**/*`,{nodir:true})
})
~~~

```shell
# webpack-dev-server
# npm i webpack-dev-server@2.9.1 -D
scripts:{
	dev:'webpack-dev-server --open'
}
# webpack.config.js
target:'web'
devServer:{
	port:3001,
	contentBase:'./dist',
	inline:true,
	historyApiFallback:true
}

# webpack开发、生产合并
# webpack-merge --save-dev
modules.exports=webpackMerge(base,{})
scripts:{
	dev:'webpack-dev-server --open --config ...dev',
	build:'webpack --config ...build'
}
```

## Vue打包

```shell
# 版本runtime-only=》不可以有template
# 版本runtime-compiler=》可以有template
# vue --save
# 别名编译
resolve:{
	alias:{
		'vue$':'vue/dist/vue.esm.js'
	},
	extensions:['.js','.css','.vue']
}
# npm i vue-loader(13) vue-template-compiler --save-dev
{
	test:/\.vue$/,
	use:['vue-loader']
}
new VueLoaderPlugin()
```

~~~shell
# 脚手架安装
# @vue/cli -g
# @vue/cli-init -g
cli2: vue init webpack xxx
cli3: vue create xxx
# vue ui
# vue.config.js
~~~

## React打包

```shell
# jsx-Babel
1. 插件安装
babel-core babel-loader babel-plugin-transform-runtime -d
babel-preset-env babel-preset-stage-0 -d
2. jsx语法转换包
babel-preset-react -d
3. 添加.babelrc配置文件
{
	'presets':['env','stage-0','react'],
	'plugins':['transform-runtime']
}
{
	test:/\.js|jsx$/,
	use:'babel-loader',
	exclude:/node_modules/
}
resolve:{
	extensions:['.js','.jsx','.json'],
	alias:{
		'@':path.join(__dirname,'./src')
	}
}
```

## Webpack.config.js

- ### resolve

~~~json
// resolve.fallback: 应急目录数组
// resolve.alias: 路径别名
// resolve.extensions：扩展名数组
~~~

