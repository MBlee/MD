## Echarts

```js
import * as echarts from 'echarts'
import bar from 'echarts/bar'
- echarts.init(dom)
- echart.setOption(obj)
/* 公共配置 */
- xAxis.data
- series:[]
  type,data,stack
  showBackground
  backgroundStyle
  itemStyle
```

```js
/***** 柱状图 ******/
- series.barWidth
- series.barGap
- series.barCategoryGap
- series.realtimeSort
```

#### 配置项

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

## Swiper

> 导入：`npm i swiper`

```js
.swiper > .swiper-wraper > .swiper-slide
```

```js
import Swiper from 'swiper/bundle';
import 'swiper/css/bundle';
const swiper = new Swiper('.swiper',<opt>);
```

```js
// Swiper配置
direction|mode: 'vertical'
autoplay: 2000
loop: true
speed：200
pagination: {
  el: '.swiper-pagination'
}
navigation: {
  nextEl: '.swiper-button-next'
  prevEl: '.swiper-button-prev'
}
scrollbar: {
  el: '.swiper-scrollbar'
}
// Swiper方法
swiper.slideNext(speed,callback)
swiper.slidePrev(speed,callback)
swiper.slideTo(index,speed,callback)
```

## BetterScroll

#### Options

scrollX|scrollY：true

eventPassthrough：horizontal

momentum：false

snap：{loop：false，threshold：0.1，stepX:100，stepY：100}

click：true

tab：tabname

wheel

preventDefaultException：{ className: /^$/ }

scrollbar	{fade,interactive}

probeType

pullDownRefresh|pullUpLoad

#### Methods

getCurrentPage： => {x,y,pageX,pageY}

next|prev：time,easing

finishPullUp|closePullUp

finishPullDown|closePullDown

refresh

scrollTo(x,y,time,easing)

scrollToElement(el,time,offsetX,offsetY,easing)

#### Events

scrollEnd|scroll(e={x,y})

pullingUp|pullingDown

<!--滚动栏-->

```js
const scroll = new BScroll(el,{
    click:true,tap:'myClick',preventDefaultException:{className:/class/}
	probeType:3,
    pullUpLoad|pullDownRefresh:true
})
scroll.refresh()
scroll.on('scroll|scrollEnd',({x,y}=>...))
scroll.on('pullingUP|pullingDown')
scroll.finishPullup()
scroll.closePullup()
```

<!--轮播图-->

```js
const scroll = new BScroll(el,{
    click:true,tap:'myClick',preventDefaultException:{className:/class/}
    probeType:3,
    snap:{loop,threshold:0.1},
    momentum:false,
    scollX:true,eventPassthrough:horizontal       
})
scroll.on('scrollEnd',()=>{})
scroll.getCurrentPage => {x,y,pageX,pageY}
scroll.next()|prev()
```



## Lodash

## AsyncValidator

## Bootstrap

#### 布局：

```shell
# 布局类
- container|container-fluid
- col
- offset
- push|pull
# 水平|垂直
justify-content|items-(start)
# width|height
- row|col
# margin|padding
- ml|mx-(em)
- pl|px-(em)
```

~~~shell
# 背景
- bg-(info)
# 文字
- text-(info)
- text-left|right|center|justify
- font-weight-(normal)
~~~

#### 常用样式：

~~~shell
# 标题 
- .h1~h6|small
# 强调
- .lead|b|strong|i|em
- .text-muted|primary|success|info|warning|danger
# 代码
- code|kbd|pre
# 列表
- .list-unstyled|inline
# 表格
- table => 
.table|table-bordered|table-striped|table-hover|table-condensed
- tr =>
.info|success|active
# 表单
- .form-control|input-lg|input-sm
- select => multiple='multiple'
- div => .checkbox|radio
- btn|a => disabled='disabled'
.btn|btn-primary|btn-lg
- form => role='form'
.form-horizontal|form-inline
- form>div => .form-group
- label => .control-label|checkbox-inline|radio-inline
# 缩略图
- .thumbnail
# 面板
- .panel|panel-default
- .panel-heading
- .panel-body
~~~

~~~shell
# 导航
- navbar|navbar-light
- nav-item|nav-link
- ul|ol =>
.nav|nav-tabs|nav-pills|nav-stacked|nav-justified
# 面包屑
- breadcrumb|breadcrumb-item
- .pagination 
- .pager
# 表单
- form-group
- form-control|is-valid
- form-control-file
- form-control-range
- form-check-input|-label
- form-text|text-muted
- noValidate
- is-invalid
- invalid-feedback
# 下拉菜单
- div => .dropdown|btn-group
- button => data-toggle='dropdown'
.dropdown-toggle
- span => .caret
- ul => .dropdown-menu
- li => .divider|.dropdown-header
- .dropdown-menu-left|right
- .active|.disabled
# 模态框
- button => 
data-toggle='modal',data-target='#id'
- $(#id).modal('show|hide')
~~~



#### 全局样式：

Form:

- form-inline/horizontal
- form-group/has-warning-feedback
- form-control/form-control-feedback

Button:  type

- btn/primary/success
- btn-lg
- btn-group/btn-toolbar
- btn-group-sm/justified/vertical/

Span

- caret
- text-hide

Img:

- img-responsive
- img-circle/rounded/thumbnail