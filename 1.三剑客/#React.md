## 组件

**函数式组件：**

> 高阶组件：fn(rfc) => rfc
>
> React.memo,React.PureComponent

```ts
// Suspense: fallback
- Suspense1 => Suspense2
- Suspense => useDeferredValue|startTransition => state!==deferred
```

~~~js
Cpt.defautProps = {} // props默认值
function Cpt(props){ return <div/> }
- props.children //插槽
  - Children.count(children)
  - Children.forEach|map(children,fn,this)
- props.jsx||()=>jsx //插槽
- props.data|fn //数据
- props.history.push(path,obj)//路由
- props.match.params._x//动态路由
- props.location//路由参数
~~~

- **useState**(initState) = [state, setState]

  > setState(newState|state=>newState)
  >
  > 重新渲染（变化）|异步执行

  > 双向绑定：value = state

- **useContext**(context)

  > createContext()=>{Provider,Consumer}

  > 1.Consumer=> { context=>return }
  >
  > 2.static contextType = context

- **useReducer**(reduce,initState)

  > => [state,dispatch]

- **useSyncExternalStore**(subscribe,getSnapShot,getServerSnapShot)

  > subscribe(callback) = > { add(callback)  return remove(callback) }
  >
  > getSnapShot() => immutable

- **useEffect**(fn|=>fn, [state]|[])

  > (fn=>fn, [])，WillUnmount|DidMount|Update

- **useLayoutEffect**() => 重绘


- **useRef**(_current) => {current:undefined}

  > 重新渲染不变|<ref={ref}>

- **useId**() => {identifierPrefix}

- **useDeferredValue**(state) => deferredValue


- **useMemo**(fn=>data, [state]|[])

  > willMount

- **useCallBac**(fn,[state]|[])

- **useDebugValue**(value,format?)

  > useHook => HookState

- **useSelector**(state=>state)

  > =>state

- **useDispatch**()

  > =>dispatch

- **自定义hook**

  > 函数组件（hook）=>最顶层

**类组件**：

```js
class Cpt extends React.Component{}
- constructor(props){
      super(props)
      this.state/this.method
}
- render(){
    // 行内 style={obj}
    // CSS类 className={str}
	// 模块化 use:['sass-loader?modules&localIdentName=[path][name]-[local]-[hash:5]']
	// 全局化 :global(_class)
  
    // 插槽 this.props.children
    // props.fn => props.jsx
  
    // this.setState({},callback)
  
    // 事件函数 onClick/onChange={fn(e).bind(this)}
    // 事件参数 e.target.value/this.refs.xxx.value
}
// 新增周期
- getDerivedStateFromProps
(state,props => return null)
- getSnapshotBeforeUpdate
(state,props => return {})
// 生命周期
- 挂载阶段
  - componentWillMount
  - render
  - componentDidMount
- 更新阶段
  - componentWillReceiveProps
  - shouldComponentUpdate
  - componentWillUpdate
  - render
  - componentDidUpdate
- 销毁阶段
  - componentWillUnmount
```

- createRef() = {current:undefined}
  - React.forwardRef( cmp(props, ref) )
  - (ref) = > this.ref = ref
- dangerouslySetInnerHTML={__html}

<!--TS-->

```tsx
import type {ReactNode,FC} from 'react'
interface IProps{
    children?:ReactNode
}
const RFC:FC<IProps>
RFC.defaultProps
```

## 路由

> 安装：`npm i react-router-dom -S`

```js
// hash模式
import {HashRouter as Router,Link|NavLink,Route}
// history模式
import {BrowserRouter as Router,Switch,Link,Route,Redirect}
// 组件history
import {useHistory，useLocation,useParams，useRouteMatch
，withRouter}
```

```js
// 三大组件
1. <Router> basename
2. <Route><switch> path,component,exact
3. <link><Redirect> to，replace
- to={pathname,search,hash,state}
// 外部接口
props.match.params._x
props.history.push(path,obj)
props.location
```

<!--RouterV6-->

```js
import {useRoutes,Navigate} from 'react-router-dom'
import type {RouteObject} from 'react-router-dom'

const Lazy = React.lazy(()=>import('@..'))

const routes:RouteObject[] = [{
    path,
    element: <Navigate to="/" />
}]

<Suspense fallback="">
	{useRoutes(routes)}
</Suspense>
```

```js
// API
- ReactDOM.createPortal(<Comp>,document.body)
```

## Redux

- Store：数据仓库
- State：1个对象，Store所有数据都放到1个State
- Action：1个动作，触发数据改变的方法
- Dispatch：将动作触发成方法
- Reducer：1个函数，通过获取动作，改变数据，生成1个新State，从而改变页面

```js
import {createStore,combineReducers,applyMiddleware}
```

```js
// 创建Store
createStore((state={},action)=>{
    action.type...
    return {...state}
}）
// 获取数据
Store.getState()
// 修改数据
Store.dispatch({type:})
// 监听数据
Store.subscribe(()=>{render...})
```

```ts
// State类型
interface TState{}
type TRootState = {
    [key in keyof TCombinedReducer]:
    ReturnType<typeof TCombinedReducer[key]>
}
type TRootState = ReturnType<TCombinedReducer>
// Action类型
type TAction = ReturnType<typeof ActionCreator>|...|
```

#### Redux-thunk

~~~js
import {thunk} from 'react-thunk'
// 使用中间件
createStore(reducers,applyMiddleware(thunk))
// 派发函数
dispatch((dispatch,getState)=>{
  dispatch(action())
})
~~~

```ts
// Action类型
ThunkAction<
    Promise<void>,
   	TState,
    any,
    TActionCreator
>
// 中间件类型
thunk as ThunkMiddleware<TState>
```

#### Redux-logger

```js
import logger from 'react-thunk'
// 使用中间件
createStore(reducers,applyMiddleware(logger))
```

#### Redux-devtools-extension

~~~js
import {composeWithDevTools} from '@redux-devtools/extension'
// 使用中间件
createStore(reducers,composeWithDevTools(applyMiddleware(thunk...)))
~~~

#### React-Redux

```js
import {Provider,connect,bindActionCreators} from 'react-redux'
// 将store用provider关联
ReactDOM.render(
<Provider store={store}>...</Provider>
)
// actions对象
connect(stateFn,actions
)(component)
// dispatch=>{...fns}
connect(stateFn,dispatchFn(dispatch){
  ()=>{ dispatch(action) }     
})(component)
// dispatch=>bindActionCreators
connect(stateFn,dispatchFn(dispatch)=>{
  bindActionCreators(action,dispatch)
})(component)
```

```ts
// connect类型
(state:TCombinedState)=>TState
typeof actions
// Props类型
type Props = TState & typeof Actions
```

## RTK

```shell
npm i react-redux @reduxjs/toolkit
create-react-app <app> --template redux-typescript
```

```js
import {createSlice} from '@reduxjs/toolkit'
export createSlice({
    name:'module',
    initialState:{},
    reducers:{
        (state,action)=>{ return {...state,action.payload} }
    }
})
import {configureStore} from '@reduxjs/toolkit'
configureStore({
    reducer:{slice.reducer}
})
```

```js
import useSlice from 'store/..'
const {action} = useSlice.actions
dispatch(action(payload))
```

```ts
import {TypedUseSelectorHook} from 'react-redux'
type GetStateFnType = typeof store.getState
export type IRootState = ReturnType<GetStateFnType>
export const useAppSelector:TypedUseSelectorHook<IRootState> = useSelector
```

## MobX5

> 安装配置

~~~bash
npm i -D react-app-rewired customize-cra @babel/plugin-proposal-decorators
~~~

`config-overrides.js`

~~~js
const {override,addDecoratorsLegacy} = require('customize-cra')
module.exports = override(addDecoratorsLegacy())
~~~

`babelrc`

~~~json
{
  "plugins":[
    ["@babel/plugin-proposal-decorators",{"legacy":true}]
  ]
}
~~~

`package.json`

```json
{
  "react-app-rewired start"...
}
```

> 装饰器

~~~js
@foo
class Person
function foo(target) {
  target.prototype.show = function(){}         )
~~~

> 核心

```js
import { observable,autorun } from 'mobx'
const obs = observable.box(xx)
const obs = observable.map(obj)|observable(obj)
autorun(()=>{	obs...	})
obs.set()
obs.get()
obs.[key]
```

## React-Query

> npm:  @tanstack/react-query

```ts
import {
    QueryClientProvider,QueryClient,
    useQueryClient,
    useQuery,
    useMutation
} from '@tanstack/react-query'

const App = <QueryClientProvider client={new QueryClient()}/>

const { isPending,error,data } = useQuery({ 
    queryKey:['todos'],
    queryFn:()=>Promise
})

const mutation = useMutation({
    mutationFn:()=>Promise,
    onSuccess:()=>{
        queryClient.invalidateQueries({
            queryKey:['todos']
        })
    }
})

mutation.mutate({id:Date.now(),title})
```

```ts
// API
- useQuery => {isPending,isError,status,err,data,isFetching}
	queryOptions({})
	queryKey:['major','sub',{condition:true},deps]
    queryFn:({queryKey})=>Promise
	enabled:!!true
- useQueries
	{queries:[]|[queryOptions...]}
- useMutation => {mutate|mutateAsync}
	mutationFn:()=>Promise
	onSuccess:()=>queryClient.invalidateQuerieds({queryKey:['']})
	retry:3
	scope:{id:serial}
```

```ts
// Plugins
```

> npm:  @tanstack/react-query-devtools
>
> npm:  @tanstack/eslint-plugin-query

```ts
import { ReactQueryDevtools } from '@tanstack/react-query-devtools'
const Devtool =  <ReactQueryDevtools initialIsOpen={false} />
```

```ts
// ESlint
```

## ...

```shell
# React-error-boundary
# SuspenseList
```

## 自定义Hook

```js
// 获取Promise状态
function checkPromiseStatus(promiseIn){
	let status,result
	const promise = promiseIn.then(res=>{
		status='fulfilled'
		result=res
    }).catch(err=>{
		status='rejected'
		result=err
    })
	return ()=>{
        promise,status,result
    }
}
// 获取窗口大小
function useWindowSize(){
    let getSize = ()=>{width:window.innerWidth}
    const [size,setSize] = useState(getSize())
    useEffect(()=>{
       window.addEventListener('resize',()=>setSize(getSize()))
       return ()=>window.removeEventListener('resize')
    },[])
    return size   
}
```

## 配置

#### Editorconfig

#### Prettier

```json
// npm: prettier => prettier --write .
// .prettierrc
sublime=>jsprettier:  {format_on_save":true}
prettier:
{
	"useTabs": false,
	"tabWidth": 2,
	"printWidth": 80,
	"singleQuote": true,
	"trailingComma": "none",
    "semi": false
}
```

```shell
# .prettierignore
/build/*
.local
.output.js
/node_modules/**
**/*.svg
**/*.sh
/public/*
```

#### ESLint

> npm: eslint  eslint-plugin-prettier eslint-config-prettier

> eslint --init

```json
// .eslintrc.js
extends:[
    "plugin:vue/vue3-essential",
    "eslint:recommended",
    "@vue/typescript/recommended",
    "@vue/prettier",
    "@vue/prettier/@typescript-eslint",
    "plugin:prettier/recommended"
]
```

```json
// vscode
// sublime
```

#### SetupProxy

```ts
const {createProxyMiddleware} = require('http-proxy-middleware')
const env = {dev:'',prod:''}
module.exports=(app)=>{
    app.use(createProxyMiddleware('/api',{
        target:env.dev,
        changeOrgin:true
    }))
}
```

