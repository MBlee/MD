# 安装

```js
npx create-react-app my-app
cd my-app
npm start
```

# 组件

核心：纯函数 > JSX对象

- State
  
  - setState( fn(state,props) ), 可能异步（浅合并）
  
  - 单项数据流

- 事件
  
  - 传参，(e)=>{ return fn(....) } | this.method.bind(this, ...)
  
  - 阻止默认，必须e.preventDefault不能Return false
  
  - this.method = this.method.bind(this)

- 条件
  
  - if else, return null
  
  - &&
  
  - ? :

- 列表
  
  - map
  
  - key，标识元素是否改变

- 表单
  
  - 受控组件，被React State控制取值的表单元素
  
  - value={}，onChange={}
  
  - e.target.name
  
  - 非受控组件，文件Input
  
  - createRef()|(ele)=>{}, 获取DOM节点
  
  - defaultValue




