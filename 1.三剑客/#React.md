## 组件

**函数式组件：**

> 高阶组件：fn(rfc) => rfc
>
> React.memo,React.PureComponent

~~~js
function Cpt(props){ return <div/> }
- props.children //插槽
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

- **useEffect**(fn|=>fn, [state]|[])

  > (fn=>fn, [])，WillUnmount|DidMount|Update


- **useRef**(_current) => {current:undefined}

  > 重新渲染不变|<ref={ref}>

- **useMemo**(fn=>data, [state]|[])

  > willMount

- **useCallBac**(fn,[state]|[])

- **useContext**(context)

  > createContext()=>{Provider,Consumer}

  > 1.Consumer=> { context=>return }
  >
  > 2.static contextType = context

- **useReducer**(reduce,initState)

  > => [state,dispatch]

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

## Redux

> 安装：`npm i redux -S`

- Store：数据仓库
- State：1个对象，Store所有数据都放到1个State
- Action：1个动作，触发数据改变的方法
- Dispatch：将动作触发成方法
- Reducer：1个函数，通过获取动作，改变数据，生成1个新State，从而改变页面

```js
import {createStore}
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

## React-Redux

> `npm i react-redux `

```js
import {createStore,combineReducers,applyMiddleware}
import {Provider,connect,bindActionCreators}
```

```js
// 将store用provider关联
ReactDOM.render(
<Provider store={store}>...</Provider>
)
// 映射到组件1
connect(stateFn|res=>res,dispatchFn(){
  ()=>{ dispatch(action) }     
})(component)
// 映射到组件2
connect(stateFn,()=>{
  bindActionCreators(action,dispatch)
})(component)
// 映射到组件3
connect(stateFn,
	{action}
)(component)
```

## Redux插件

#### Redux-thunk

> `npm i redux-thunk -S`

~~~js
// 使用中间件
createStore(reducers,applyMiddleware(THUNK))
// 派发函数
dispatch((dispatch,getState)=>{
  dispatch(action())
})
~~~

#### Redux-devtools

~~~js
import {createStore,applyMiddleware,compose} from 'redux'
const composeEnhancers =
  typeof window === 'object' && window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__
    ? window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__({
        // Specify extension’s options like name, actionsDenylist, actionsCreators, serialize...
      })
    : compose;

const enhancer = composeEnhancers(
  applyMiddleware(THUNK)
  // other store enhancers if any
);
const store = createStore(reducer, enhancer);
~~~

#### Redux-devtools-extension

~~~js
import {composeWithDevTools} from '@redux-devtools/extension'
~~~

~~~js
// 使用中间件
createStore(reducers,composeWithDevTools(applyMiddleware(THUNK...)))
~~~

#### Redux-logger

> npm i redux-logger -S

~~~js
// 使用中间件
createStore(reducers,applyMiddleware(THUNK))
~~~

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

## Mobx5

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

