### 初始化

npm init vite-app xxxPro

**创建App实例**

Vue.createApp({

​    render: h=>h(app)

}).mount()

**模板语法**

v-bind|v-on|v-model|{{表达式}}

:class|:style，xxxStr|{class: true}|[str|{}]

.once|.stop|.prevent|@keydown.enter

.lazy|.number|.trim

v-once|v-html

v-if|v-saahow|v-for

**Script**

data=> computed=> watch

components

created=> mounted=> updated=> destroyed|unmounted

**组合API**

setup(props, context|{attrs, slot, emit})，创建组件之前执行

return

- ref，ref.value

- reactive，computed

- toRefs，...toRefs(xxxObj)

监听

- watchEffect|watch

生命周期

- onBeforeMount|onMounted
- onBeforeUpdate|onUpdated
- onBeforeUnmount|onUnmounted

Provide

- provide('xxx', xxxData)
- inject('xxx')

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

**状态管理**

- state: reactive({})

- setState()....

- provide{store}

**vite配置跨域**

vite.config.js > module.exports

proxy > "/api"

target: '"'

changeOrigin: true

rewrite: path => path.replace(/^\/api/, "")
