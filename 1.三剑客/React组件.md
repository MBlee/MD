### 组件模板

~~~js
// 函数组件
function CP(props){
    return <div/>
}
// 类组件
class CP extends React.Component{
    constructor(props){
        super(props)
        this.state|method
    }
    render(){
       	// 样式 style|className={}
        // 数据 this.setState
        // 事件 onClick|Change = fn.bind(this)
        // 事件参数 e.target.value|this.refs.xxx.value
        // 插槽 this.props.children
    }
}
// 生命周期
- 创建
    - componentWillMount
    - render
    - componentDidMount
- 运行
    - componentWillReceiveProps
    - shouldComponentUpdate
    - componentWillUpdate
    - render
    - componentDidUpdate
- 销毁
    - componentWillUnmount
~~~

