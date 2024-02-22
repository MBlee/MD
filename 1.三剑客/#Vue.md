## VUE2

#### 过渡&动画

```vue
<!-- CSS单过渡 -->
<transition
	name="prefix"
    enter|leave-active-class
	enter|leave-class
	enter|leave-to-class
	:duration={enter,leave}|millions
/>
<!-- JS单过渡 -->
<transition
	@before-enter=(el)
    @enter=(el,done)
    @after-enter=(el)
	@enter-cancelled=(el)
	:css=false
/>
<!-- 初渲染过渡 -->
<transition
    appear
    appear-active-class
	appear-class
	appear-to-class
	@before-appear=(el)
    @appear=(el,done)
    @after-appear=(el)
	@appear-cancelled=(el)
	:css=false
/>
<!-- 多元素|组件过渡 -->
<transition
    mode="out-in|in-out"
/>
<component :is='cname'/>
<!-- 列表过渡 -->
<transition-group
	name=v-move
	tag=p
/>
<!-- 过渡类 -->
.v-enter|leave-to
.v-enter|leave-active
```

```js
<!-- 状态过渡 -->
```

#### Vue组件

~~~shell
# Vue属性
- props | data
- computed | watch | method
- provide(()=>{...props}) => inject:['props']
# Vue周期
- created | mouted | update
# API
1. this.$emit
2. this.$refs
3. this.$parent|$root|$children
~~~

~~~shell
# Vue指令：
- v-bind / v-on / v-model / v-if-show / v-for
- v-html / v-once
- v-slot: / slot: slot-scope:
- <slot> name,...props
# v-on：.stop/.prevent/.capture/.self/.once/.passive/@keydown.enter
# v-model：.lazy/.number/.trim
# 样式
- :class|:style = xxxStr|{class: true}|[str|{}]
- /deep/	>>>
- ::v-deep
# 事件
1. @click = 'method',传e
2. @click = 'method()',传参
3. @click = 'method($event,args)',传e传参
~~~

#### Vue-Router

> 安装：npm i vue-router@3 || vue add router

```js
Vue.use(Router) => new Vue({router})
```

> API

```html
<keep-alive exclude> =>activated
<router-link to  tag  active-class> 
<router-view name>
```

```js
// 路由设置
- path,name,redirect,alias
- component|s:{default}
- meta
- props
// 懒加载
- ()=>({loading,error,component:import,delay,timeout})
- ()=>import(/*webpackChunkName:xx*/'xx')
- (res)=>require(['xx'],res)
- (res)=>require.ensure([],()=>res(require('xx')),'chunkName')
// 动态路由
- path:"/page/:id?*+(\reg)"
- props:boolean|route=>props	(route.params)
// 动态路由监听
- watch|this.$watch: $route(to,from)=>...
- beforeRouteUpdate(to,from,next)=>...
// 404路由
- path:'*'|'/user-*'
// 嵌套路由
- children:[path:'']
// 重定向|别名
- redirect:route=>newroute|{name}
- alias:[]
```

```js
// 获取路由
- $route.matched[]
- $route.path|fullPath
- $route.params.id
- $route.params.pathMatch
- $route.query.id
- $route.hash
// 切换
- $router.push|replace(location,onComplete?,onAbort?)
- $router.go(n)
- window.history.length > 1?
  $router.go(-1):
  $router.push('/')
// 更新数据
- created=>this.$watch({immediate})
- beforeRouteEnter(next(vm=>..)) => beforeRouteUpdate
```

```js
// 路由周期
- beforeEach|afterEach( to.matched )
- beforeResolve
- beforeEnter 
- beforeRouterEnter|Update|Leave
next(false|Error|route)
next(vm=>..)
```

#### Vuex

```js
/* store */
getters:{ (state,getters)=>{ return arg=>{}} }
mutations:{ (state,payload)=>{} }
actions:{ (context,payload)=>{ context.commit('') } }
modules:{}
namespaced:true
```

```js
/* 映射 */
import {mapState,mapGetters,mapMutations,mapActions} from 'vuex'
computed:{
    ...mapState(module,['data']),
    ...mapGetters(module,{ 'state':'data' })
}
methods:{...mapMutations,...mapActions}
/* 调用 */
$store.dispatch(module/type,payload)
$store.commit(module/type,payload)
```

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
npm init vite-app <app>
npm create vue@latest <app>
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

#### 过渡&动画

#### Vue组件

```js
// 组合式API
setup(props,context|{emit,attrs,slots}){
	return {}|(h)=> h(component)
}
// 属性|接口
- defineProps:[{type,default(),required,validator(value)}]
- withDefaults(defineProps<Props>(),{data,method:()=>[]})
- defineEmits:[null,(params)=>{return true}]
- defineEmits<{(e:'change',id:number)}>()
- defineEmits<{change:[id:number]}>()
modelValue|update:modelValue =>v-model:
modelModifiers => {default()=>({})}
ref(null|[])=>:ref=>(el)=>{}
expose:['data','method']|defineExpose({a,b})
// 插槽
<template #|v-slot:name='p'> 
  {{p[scopeData]}} 
<template>
<slot name scopeData/>
// 异步组件
defineAsyncComponent(()=>{promise.resolve({import('component')})})
defineAsyncComponent({
  loader()=>{},
  loadingComponent,errorComponent,
  delay,timeout
})
```

```js
// 样式
:deep() :global() :slotted()
$style => useCssModule
v-bind(color)
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

```ts
// 组件引用类型
ref<(InstanceType<typeof CMP>|null)>
ref<ComponentPublicInstance>
```

> 渲染函数&JSX

```shell
# Vite配置
- npm i @vitejs/plugin-vue-jsx
vite.config.js>>
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueJsx from "@vitejs/plugin-vue-jsx";
export default defineConfig({
  plugins: [
  	vue(),
  	vueJsx()  //添加 jsx
  ]
})
# Webpack配置
- npm install @vue/babel-plugin-jsx -D
babel.config.js>>
module.exports = {
  plugins: ["@vue/babel-plugin-jsx"]   // 省略其他配置
}
# 类型推断 /* @jsxImportSource vue */
{
  "compilerOptions": {
    "jsx": "preserve",
    "jsxImportSource": "vue"
  }
}
```

```tsx
// 函数式组件
- xx.vue>>
render(){
	return h('div',this.data)|'div'|[...]    
}
setup(props,{ slots }){
	return h('div',this.data)|'div'|[...]    
}
- xx.js>>
function CPT(){
	return h('div',this.data)|'div'|[...] 
}
// vnodes
const vnode = h(MyComponent|'div',
  props:{}|null,
  children:[
      slots.default({})
  ]
)
const vnode = <my-component {...props}></my-component>
// 插槽
slots.default({text})
{
  default: ({ text }) => 'default slot',
  foo: ({ text }) => <div>foo</div>,
}
// v-if
isData?div1:div2
// v-for
arr.map(()=>div)
// v-on
onClickCapture={withModifiers(()=>{},['self'])}
// v-model
props: ['modelValue'],
emits: ['update:modelValue']
h(CPT,{
    modelValue:props.modelValue,
    'onUpdate:modelValue':(value)=>emit('update:modelValue',vaule)
})
```

#### **Vue-Router**

> 安装：npm i vue-router@4

```js
Vue.createApp().use(router)
```

> API

```js
// 路由器设置
- Router.createRouter() 
- history
createWebHistory('/baseURL/')
createWebHashHistory()
createMemoryHistory()
- strict
- sensitive
```

```js
// 动态路由监听
watch(()=>this.$route.params,(to,pre)=>...)
onBeforeRouteUpdate(to,pre)=>...
// 404
path:/:pathMatch(.*)*
path:/:user-:pathMatch(.*)*
```

```js
// 路由周期
- beforeEach|afterEach(to,from,faliure)
- beforeResolve
- beforeEnter([])
- onBeforeRouterEnter|Update|Leave
return false | throw Error
// 更新数据
- watch(route=>route.params,fetch,{immediate:true})
- beforeRouteEnter(to,from,next)=> fetch({next(vm=>vm.setData)})
```

```js
// 获取
- useRoute
// 切换
- useRouter
// useLink
- props:{...RouterLink.props}
- useLink(props) => route,href,isActive,navigate
```

```vue
<router-view v-slot="{Component}">
<transition><keep-alive>
	<component :is="Component" prop ref/>
</router-view>
```



#### Vuex

```shell
npm i vuex@4
```

```js
import {createApp} from 'vue'
createApp(App).use(store)
```

```js
import {useStore} from 'vuex'
Vuex.useStore()
```

- state: reactive({})
- setState()....
- provide{store}

#### Pinia

```css
# npm i pinia
```

```js
/* main.js */
import {createPinia} from 'pinia'
createApp(App).use(createPinia())
```

```js
/* store */
import {defineStore,storeToRefs} from 'pinia'
export const useStore = defineStore('store',()=>{
    const state = ref()
    const getters = computed(()=>{})
    const method = ()=>{}
    return {
        state,getters,method
    }
})
const store = useStore()
const {state,getters} = storeToRefs(store)
const {method} = store
```

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

