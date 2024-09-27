## Webpack打包

#### 通用打包

```shell
npm i webpack webpack-cli -D
# 初始化
npm init -y
# 打包
webpack src -o build --mode development/production
# 自带插件BannerPlugin
new webpack.BannerPlugin()
# 清除打包
new cleanWebpackPlugin()
```

```js
### 打包配置
// webpack.config.js
module.exports={
    mode:'develepment',
    entry:'obj/arr/str',
    output:{
        filename:'[name].js',
        path:'resolve(__dirname,'build')',
      	clean:true
    },
    module:{
        rules:[]
    },
    plugins:[]
}
### ES6转ES5
//  npm i babel-loader @babel/core @babel/preset-env
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
### Typescript
// npm: typescript ts-loader ts-node
{
    test:/\.ts$/,exclude,
    use:'ts-loader'
}
### Eslint
//  npm i eslint eslint-loader eslint-plugin-import eslint-config-airbnb-base 
// package.json
'eslintConfig':{
    'extends':'airbnb-base'
}
// webpack.config.js
{
    test:/\.js$/,exclude,
    loader:'eslint-loader',
    options:{
        fix:true
    }
}
// 禁用Eslint
- eslint-disable-next-line
- eslint-disable
```

```js
# 打包HTML
// npm i html-webpack-plugin 
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
// npm i uglifyjs-webpack-plugin@1.1.1
new uglifyjsPlugin()
```

```js
# 打包Css
// npm: css-loader style-loader
// npm: less less-loader node-sass sass-loader
{
    test:/\.(css|less|scss)$/,exclude,
    use:['style-loader','css-loader','less-loader']
}
// Css模块化
{
    test:/\.css$/,exclude,
    use :['style-loader','css-loader?modules&localIdentName=[path][name]-[local]-[hash:5]']
}
# 提取CSS文件
//npm i mini-css-extract-plugin -D
new miniCssExtractPlugin()
{
    test:/\.(css|less|scss)$/,exclude,
    use:[miniCssExtractPlugin.loader,'css-loader','less-loader']
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
    test:/\.(css|less|scss)$/,exclude,
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
```

```js
//打包图片
//npm i url-loader file-loader -D
{
    test:/\.(png|jpg|gif)$/,
    use:[
        loader:'url-loader',
        options:{
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
```

```js
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
```

```shell
# 环境优化

# HMR模块热替换
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
# tree-shaking去除无用js，terser-webpack-plugin
1.必须ES6模块化 2.开启Production
# 去CSS
# purgecss-webpack-plugin去除无用Css
const {resolve,join} = require('path')
const glob = require('glob')
const PATHS = {src:join(__dirname,'src')}

new PurgecssPlugin({
    paths:glob.sync(`${PATHS.src}/**/*`,{nodir:true})
})
```

```shell
# webpack开发、生产合并
# webpack-merge --save-dev
modules.exports=webpackMerge(base,{})
scripts:{
    dev:'webpack-dev-server --open --config ...dev',
    build:'webpack --config ...build'
}
```

```ts
// npm: webpack-dev-server
// npm: @types/node @types/webpack @types/webpack-dev-server
import type{ Configuration } from 'webpack'
import 'webpack-dev-server'
target:'web',
devServer:{
	hot|open|host|port,
   	compress,
   	historyApiFallback: { rewrites:[{form,to}] },
    static:{
        directory|publicPath|serveIndex
    }
}
export default [ClientConfig,ServerConfig]
```

#### Vue打包

```shell
# 版本runtime-only=》不可以有template
# 版本runtime-compiler=》可以有template
# vue --save
# npm i vue-loader(13) vue-template-compiler --save-dev
{
    test:/\.vue$/,
    use:['vue-loader']
}
new VueLoaderPlugin()
# 别名编译
resolve:{
    alias:{
        'vue$':'vue/dist/vue.esm.js'
    }
}
```

```shell
# 脚手架安装
# @vue/cli -g
# @vue/cli-init -g
cli2: vue init webpack xxx
cli3: vue create xxx
# vue ui
# vue.config.js
```

#### React打包

```shell
# Babel7
1. 安装插件
npm: babel-loader @babel/core 
@babel/preset-env @babel/preset-react @babel/preset-typescript 
@babel/plugin-transform-runtime
2. .babelrc
{
	"presets":["@babel/preset-env","@babel/preset-react","@babel/preset-typescript"]
	"plugins":["@babel/plugin-transform-runtime"]
}
3. webpack.config.js
{
	test:/\.c?(j|t)sx?$/,exclude,
	use:{ loader:"babel-loader" }
}
```

```shell
# Babel7以下
1. 安装插件
npm: babel-loader babel-core 
babel-preset-env babel-preset-stage-0 babel-preset-react
babel-plugin-transform-runtime
2. .babelrc  
{
    'presets':['env','stage-0','react'],
    'plugins':['transform-runtime']
}
```

#### 配置

- resolve
  - extensions
  - alias
  - fallback
