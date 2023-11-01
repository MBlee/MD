## 秒建

<!-- Vue2-Cli3 -->

```shell
vue create <app>
npm i axios vuex vue-router
```

```shell
# .editorconfig
# .prettierrc
# .prettierignore
# .eslintrc.js
```

```shell
# api/index.js 
# store/index.js
# router/index.js
# css/base.js
```

```shell
# 跨域
devServer.proxy => '/api',{
	target,changeOrigin,
	pathRewrite:{'^/api':''}
}
# 环境变量
.env|.env.development|.env.production => VUE_APP_
=> process.env.VUE_APP_
=> BASE_URL|NODE_ENV
```

~~~shell
# 别名
vue.config.js => configureWebpack.resolve.alias
vue.config.js => defineConfig({})
~~~

<!-- Vue3-cli3 -->

## Vue2商城

#### TabBar

#### 导航栏

#### 轮播图

#### 推荐图

#### TabControl

#### BScroll+BackTop

#### 上拉加载+下拉刷新

