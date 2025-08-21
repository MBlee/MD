### Vue3

~~~shell
# vite安装（冷启动、热重载、按需编译）
npm init vite-app xxxPro
~~~

##### 入口函数

~~~js
import {createApp} from 'vue'
import App from './App.vue'
// Vue3入口
createApp(App).mount('#app')
Vue.createApp({
    render: h=>h(app)
}).mount()
// Vue2入口
new Vue({ render:h=>h(app) }).$mount('#app')
~~~

##### 组合API

~~~js
// setup（配置函数）重名优先|不能访问vue2配置
1.参数（props,context|{attrs,slots,emits}）
2.返回对象|渲染函数
// 数据|方法
- ref|.value，reactive
- toRefs，...toRefs(xxxObj)
- computed
# shallowReactive|Ref
# readonly|shallowReadonly
# toRaw|markRaw
// 监听
- watchEffect|watch(xx|[xx],fn,{immediate})
- watch(()=>obj.key,...)deep有效
1. 对象无法获取oldValue
2. 强制开启deep（配置无效）
// 生命周期 
- onBeforeMount|onMounted
- onBeforeUpdate|onUpdated
- onBeforeUnmount|onUnmounted
# customRef
return customRef((track,trigger)=>{
  return {
    get(){ track() return value }
    set(newValue){ trigger() }
  }
})
~~~

Provide

- provide('xxx', xxxData)
- inject('xxx')

##### 模板语法

v-bind|v-on|v-model|{{表达式}}

:class|:style，xxxStr|{class: true}|[str|{}]

.once|.stop|.prevent|@keydown.enter

.lazy|.number|.trim

v-once|v-html

v-if|v-saahow|v-for

##### Script

data=> computed=> watch

components

created=> mounted=> updated=> destroyed|unmounted

**路由**

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

##### 状态管理

- state: reactive({})

- setState()....

- provide{store}

##### vite配置跨域

vite.config.js > module.exports

proxy > "/api"

target: '"'

changeOrigin: true

rewrite: path => path.replace(/^\/api/, "")
