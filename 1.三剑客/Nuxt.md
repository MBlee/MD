## Nuxt2

```shell
npx create-nuxt-app <app>
# or
npm i nuxt@2 => nuxt
```

#### 路由

```jsx
// 布局文件
default.vue=> layout:"custom"
<Nuxt/> 
<nuxt-child/>
<nuxt-link to="/">
```

```jsx
// 动态路由
pages/_id/_params	=>$route.params.id|params
pages?id=xx&params=xx	=>$route.query.id|params
pages/_.vue
// 参数校验
validate({params,query}){
    return /\/.test(params.id)
}
```

```js
// 异步数据
- (process.server) 跳转：服务端，刷新：客户端
asyncData({params,query,route}){
    return {}
}
```

#### 组件

```markdown
# 图片资源
1. class|img => ~assets...
2. style => require(~/assets|static...)
```

#### 配置

> nuxt.config.js

```js
component:true
```

> npm i less less-loader node-sass sass-loader@^10 fibers
>
> npm i @nuxtjs/style-resources

```js
css:['~/.less','~/.scss']
styleResources:{
    less:['~/xx.less'],
    scss:['~/xx.scss']
}
buildModules:['@nuxtjs/style-resources']
```

## Nuxt3

```shell
npx nuxi@latest init <app>
npm run dev -o
```

#### 路由

```jsx
app.vue => <NuxtPage />
layout.vue => <slot />
<NuxtLink to="/"/>
```

```jsx
// 动态路由
pages/[id].vue	=> useRoute().params.id
pages?id=xx&params=xx	=> useRoute().query.id|params
```

```js
// 路由校验
definePageMeta({
    validate:aysnc(route)=>{
        return /\.test(route.params.id)
    }
})
// 路由中间件
- vue=> definePageMeta{middleware:[]}
- middleware/.global.js
- addRouteMiddleware('xx',()=>..,{global:true})
export default defineNuxtRouteMiddleware(to,from){
    if(to.params.id) return abortNavigation()
    if(to.path !== '/') return navigateTo('/')
}
- abortNavigation(err)
- navigateTo('/',{redirectCode})
// 数据获取
- useFetch(url,{})
baseURL|method|query|params|body|headers
onRequest|onRequestError
=>data|pending|status
```

> SEO和Meta

```ts
// 默认值
- defineNuxtConfig({opt})=>
app.head.charset:'utf-8'
app.head.viewport:'width=device-width,initial-scale=1'
// useHead({})
- title
- meta.name|content
- bodyAttrs.class
- script:[{innerHTML}]
// useSeoMeta({})
- title
- ogTitle
- description
- ogDescription
- ogImage
- twitterCard
```



#### 配置

```jsx

```

## 服务端渲染

```shell
npm i vue vue-server-renderer -S
```

```js
// 创建Vue实例
const Vue = require('vue')
const app = new Vue({
  template:`<div/>`
})
// 渲染HTML
const renderer = require('vue-server-renderer').createRenderer()
renderer.renderToString(app,(err,html)=>{
  if err throw err;
  res.end(html)
})
renderer.renderToString(app).then(html=>{})
```

```js
// HTML模板=>
{{{html}}}
{{data}}
<!---vue-ssr-outlet--->
// 渲染HTML
const renderer = require('vue-server-renderer').createRenderer({
    template:fs.readFileSync('filepath','utf-8')
})
renderer.renderToString(app,{
	data,div
},(err,html)=>{
  if err throw err;
    return res.status(500).end('error')
  res.setHeader('Content-Type','text/html;charset=utf-8')
  res.end(html)
})
```

