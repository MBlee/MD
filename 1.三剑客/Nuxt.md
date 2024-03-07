## Nuxt2

```shell
npx create-nuxt-app <app>
yarn create nuxt-app <app>
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
// 中间件
- /middleware
global.js|md.client|server.js	=>default(context:{route,req.headers})=>...
- /nuxt.config.js
router.middleware:[{ src,mode }]
- /page.vue
middleware
```

```js
// SEO
全局nuxt.config.js>>
- head.title:''
- head.meta:[{name,content,hid}]
- head.link:[rel,href,type]
- head.htmlAttrs.lang
局部*.vue>>
- head(){
    return{
        title,meta
    }
}
```

```js
// 权限校验中间件
export default ({store,redirect})=>{
    if(!store.state.auth) redirect('/')
}
```

#### 组件

```markdown
# 图片资源
1. class|img => ~assets...
2. style => require(~/assets|static...)
```

```js
// 异步数据
- (process.server) 跳转：服务端，刷新：客户端
asyncData({app,params,query,route}){
    return {}
}
// Loading
nuxt.config.js>>
- loading:'~/components/loadingbar'
this.$nextTick>>
- this.$nuxt.$loading.start|close()
```

> 插件

```js
- /plugins
xx.client|server.js
- /nuxt.config.js
plugins:[{	src,mode	}]
```

```js
// v-tooltip插件
Vue.use(tooltip)
```



```js
// axios插件
export default(context:{store,router},inject)=>{
    inject('api',{
        methods...
    })
}
asyncData:	app=>app.$api.methods()|this.$api
```

> 数据

```js
// 页面特有
asyncData:(context:{app})=>{}
// 公有
fetch(context|this)
// 生命周期
middleware=>beforeCreated|created=>mounted=>nuxtServerInt
```

#### Axios

```js
// @nuxt/axios
nuxt.config.js>>  mudules:['@nuxt/axios']
page.vue>>  asyncData({$axios})|this.$axios
```

```js
// axios
plugins>>  export default(context:{store,router},inject)=>{
    inject('api',{
        methods...
    })
}
pages>>  asyncData:	app=>app.$api.methods()|this.$api
```

#### Vuex

```js
store\*.js|state.js>>
export const state|mutations|actions = ()=>{}

actions.nuxtServerInit(context,{req}){
    context.commit
    cookie.set()|remove()
    cookieparser.parse(req.headers.cookie)
}
// js-cookie && cookieparser
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

> TS类组件

```shell
npm i vue-property-decorator vue-class-component
```

```js
import {Vue,Component} from 'vue-property-decorator'
@Component
export default class C extend Vue{
    msg:string = ''
}
```

#### ETC

> 动画过渡

```js
- default.vue=>
.page-enter|.page-leave-to
.page-enter-active
- page.vue=>
transition:xxx
```

> 部署

```shell
# 静态部署(动态路径)
- yarn generate
- dist>>nginx.config
```

```shell
# 动态部署
- yarn build
- .nuxt&static&nuxt.config.js&package.json
- yarn install && yarn start
```

## Nuxt3

```shell
npx nuxi@latest init <app>
npm run dev -o
```

#### 路由

```jsx
>>> <NuxtPage/>
pageKey=static|route=>route.fullPath
definePageMeta({key})
ref => ref.value.pageRef
>>> <NuxtLayout/>
name='layout'
xx=>useAttrs().xx
ref => ref.value.layoutRef
>>> <NuxtLink/>
to="/"
target="__blank"
rel|noRel=""
>>> <slot/>
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

#### 组件

```js
// 数据获取
- useFetch(url,{})
baseURL|method|query|params|body|headers
onRequest|onRequestError
=>data|pending|status
```

#### 配置

```jsx

```

#### ETC

> 动画过渡

```js
<NuxtPage :transition="{name,mode}">
```

```js
// 页面过渡
>>> nuxt.config.ts
export default defineNuxtConfig({
  app:{
      pageTransition:{name,mode:'out-in'}|false
  }  
})
>>> page.vue
definePageMeta({
    pageTransition:{name}|false,
    onBeforeEnter:el=>,
    onEnter:(el,done)=>,
    onAfterEnter:el=>
})

// 布局过渡
>>> nuxt.config.js
export default defineNuxtConfig({
	app:{
        layoutTransition:{name,mode}|false
    }    
})
>>> page.vue
definePageMeta({
    layout,
    layoutTransition:{name}|false
})
// 动态过渡
>>> page.vue
definePageMeta({
    middleware(to,from){
        to.meta.pageTransition.name
    }
})
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

