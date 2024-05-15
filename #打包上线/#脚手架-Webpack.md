#### 全局配置

```markdown
# SourceMap
- devtool:'source-map'|false
- eval-source-map
- nosources-source-map
- cheap-module-source-map
# 路径配置
- output.publicPath
- resolve.alias
- resolve.extensions
```

#### 本地服务器

```markdown
# 拦截器
- proxy:{
  '^/api':{
  	changeOrigin:true,
  	target:'server_host',
	pathRewrite:{ '^/api':'' } ,
    cookieDomainRewrite:'',
    secure:true
  }
}
# 服务器
# 热替换
```

#### 模块

```markdown
# 样式
- style.sass
	.loadOptions

# 外部模块
# 资源模块
# TreeShaking
# 库
```

```markdown
# 输入输出
# Module
# Plugin
# 优化压缩
- optimization.minimize
- optimization.minimizer:[]
```

#### ......

#### vue

> **vue.config.js**

```shell
# 全局配置
- configureWebpack:(config)=>...
- chainWebpack:(config)=>...
- devServer
- devtool
- productionSourceMap
- outputDir:output.path
```

```shell
# plugins
```

#### react

> **craco.config.js**

```shell
# 全局配置
- webpack.configure:(config,{env,paths})=> config
- devServer: (config,{env,paths,proxy,allowedHost})=> config
- devtool
- alias
```

```shell
# Plugins
- webpack.plugins.add:[new Plugin(),'append']
```

```shell
#! 样式
# 全局sass
- craco-sass-resources-loader
- plugins:[{
	plugin:sassResourcesLoader,
	options.resources:  ['.scss']
}]
```



