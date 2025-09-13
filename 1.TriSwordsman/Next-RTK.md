`npm: @reduxjs/toolkit  react-redux`

## Store/Slice

```ts
// Store
const store = configureStore({reducer})
// Slice
const slice = createSlice({
  name,initialState,
  reducers:{
    (state,action)=>{	return {...state,action.payload} }
  }
})
// CreateAsyncThunk 
// CreateEntityAdapter
// CreateReducer
// CreateAction
```

```ts
// ReduxPersist
```

```ts
// ReactReduxFirebase
```

```ts
// Normalized
```

```ts
import {TypedUseSelectorHook} from 'react-redux'
type GetStateFnType = typeof store.getState
export type IRootState = ReturnType<GetStateFnType>
export const useAppSelector:TypedUseSelectorHook<IRootState> = useSelector
```

## ReactRedux

```ts
// Manipulation
const {action} = useSlice.actions
dispatch(action(payload))
// Access
const state = useSelector(state=>...)
```

## Next

```shell
# SSR Compatibility
- 每个请求创建Store
- 服务端渲染=客户端渲染
- SPA路由（重置）
- 服务端缓存
```

