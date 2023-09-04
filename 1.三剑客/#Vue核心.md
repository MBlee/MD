## VUE2

#### Vue组件

~~~shell
# Vue属性
- props / data
- computed / watch / method
# Vue周期
- created / mouted / update
# API
1. this.emit
2. this.refs/$children
~~~

~~~shell
# Vue指令：
- v-bind / v-on / v-model / v-if-show / v-for
- v-html / v-once
- v-slot: / slot: slot-scope:
- <slot> name,...props
:class|:style，xxxStr|{class: true}|[str|{}]
# v-on：.stop/.prevent/.capture/.self/.once/.passive/@keydown.enter
# v-model：.lazy/.number/.trim
# 事件
1. @click = 'method',传e
2. @click = 'method()',传参
3. @click = 'method($event,args)',传e传参
~~~

#### Vue-Router

Router属性：

- routes: { path , component , children }
- mode , linkActiveClass

Router周期：

- beforeEach( to.matched )
- beforeEnter , beforeRouterEnter

API:  1. $router.push     2.$routes.query

Router组件：

- <router-link> to , tag , active-class
- <keep-alive> exclude , activated

#### Vuex

Store属性：

- getters: (state, getters)=> return (arg)=>...
- mutations:(state, payload)=>...
- actions:(context,payload)=> return promise

API：1. $store.getters     2. $store.commit     3. $store.dispatch

#### Axios

API:

- axios(obj).then(res=>)
- axios.all(axios...).then

封装：

1. axios.create(obj)
2. axios.interceptors.response.use
3. return promise

#### 全局API

全局API：

- Vue.extend(xxx)
- Vue.component(xx，obj)
- Vue.use(obj)
- Vue.$bus.emit/on/off

实例API：

- app.mixin(xxx)
- app.set/delete
- app.nextTick(callback).then

## VUE3

```shell
# vite安装（冷启动、热重载、按需编译）
npm init vite-app xxxPro
```

```js
import {createApp} from 'vue'
import App from './App.vue'
// Vue3入口
createApp(App).mount('#app')
Vue.createApp({
    render: h=>h(app)
}).mount()
// Vue2入口
new Vue({ render:h=>h(app) }).$mount('#app')
```

#### Vue组件

```js
// 组合式API
setup(props,context|{attrs,emits,slots}){
	return {}|(h)=> h(component)
}
// 属性|接口
defineProps:[{type,default(),required,validator(value)}]
defineEmits:[null,(params)=>{return true}]
modelValue|update:modelValue =>v-model:
modelModifiers => {default()=>({})}
ref=>(el)=>{}|expose:[]
// 异步组件
defineAsyncComponent(()=>{promise.resolve({import('component')})})
defineAsyncComponent({
  loader()=>{},
  loadingComponent,errorComponent,
  delay,timeout
})
```

```js
// 数据|方法
- ref|.value，reactive
- toRefs，...toRefs(xxxObj)
- computed
- shallowReactive|Ref
- readonly|shallowReadonly
- toRaw|markRaw
// 监听数据
- watchEffect(fn)|watchPostEffect()
- watch(xx|[xx],fn,{immediate})
- watch(()=>obj.key,{deep:true})
// 生命周期 
- onBeforeMount|onMounted
- onBeforeUpdate|onUpdated
- onBeforeUnmount|onUnmounted
- onActivated|onDeactivated
# customRef
return customRef((track,trigger)=>{
  return {
    get(){ track() return value }
    set(newValue){ trigger() }
  }
})
// provide,inject
- provide(key,value)
- inject(key,default|()=>{obj},true)
```

#### **Vue-Router**

404匹配：path: "/:path(.*)"

正则匹配：path: "/:id(\\\d+*?)"

跳转：push|replace|go

- ("")|{path|name, params, query}

多组件：components{default...} > router-view.name

重定向：redirect: (to)=>{return {path:}}

别名：alias: ""|[]

导航守卫：

- beforeEach((to, from, next)=>{ next()})
- beforeEnter((to, from))
- beforeRouteEnter|Leave|Update

#### Vuex

- state: reactive({})
- setState()....
- provide{store}

#### vite配置跨域

vite.config.js > module.exports

proxy > "/api"

target: '"'

changeOrigin: true

rewrite: path => path.replace(/^\/api/, "")

## UI框架

#### ElementUI

```js
// 安装引用 npm i element-ui -S
import ElementUI
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI)
// 按需引入 npm i babel-plugin-component -D
// babel.config.js
// presets:[['@babel/preset-env',{'modules':false}]]
// 'plugins':[
  ['component',{'libraryName':'element-ui',
    'styleLibraryName':['theme-chalk']}]
]
import {Button,Select}
Vue.component(Button.name,Button)
```

