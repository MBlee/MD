## 打包流程

~~~shell
#初始化
npm init -y
npm i webpack webpack-cli -D
#打包
webpack src -o build --mode development/production
~~~

~~~js
//打包配置
//webpack.config.js
module.exports={
    mode:'develepment',
    entry:'arr/obj/str',
    output:{
        filename:'[name].js',
        path:'resolve(__dirname,'build')'
    },
    module:{
        rules:[]
    },
    plugins:[]
}
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
//打包Css
//npm i css-loader style-loader -D
```

