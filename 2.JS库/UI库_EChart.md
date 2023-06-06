# Echart

```js
1. echarts.init(dom)
2. echart.setOption(obj)
```

### 配置项

```shell
# 功能组件
// 标题组件
title:{
    text:''    
}
// 图例组件
legend:{
    data:[]
}
// 提示组件
tooltip:{
    trigger:'' // axis,item
}
// 工具箱组件
toolbox:{
    feature:{
        savaAsImage:{} // 另存为图片
    }
}
// 颜色配置
color:[]

# 内容配置
// 网格配置
grid:{
    left:'%',
    right:'%',
    bottom:'%',
    containLabel:'true'
}
// Axis
xAxis:{
    type:'' // category,value
    data:[],
    boundaryGap:true/['20%','20%']
}
// 系列图表
series:[
    {
        name:'',
        data:[],
        stack:'',
        type:'', // line
    }
]
```

