# Angular

## Angular简介

AngularJS/Angular2/4/5（路由）

#### 项目搭建：

```shell
# 安装@angular/cli
npm i -g @angular/cli
# 创建项目
ng new xxx
npm i
# 运行
ng serve --open
```

# Typescript

```shell
# 安装
npm i -g typescript
# 编译
tsc .ts
# 任务→监视tsconfig.json
tsc --init
```

### 数据类型

- 基本类型 ：number|boolean|string
- 数组类型：string[] / Array<string>
- 元组类型：[string, number, boolean]
- 枚举类型：enum e{ success=1 ,error = -1 }     :e

# JQuery

### 常用API

入口函数：**$(document).ready(fn) / $(fn)**

jQuery对象：**$('selector'/dom)**

文本：**text()**

样式：**css()**

事件：**click()**

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

# Bootstrap

- 布局：col-offset-push

### 封装类

```js
// table
- table-responsive
- table-condensed/striped/bordered/hover
- active/success/info/warning/danger

// form
- form-inline/horizontal
- form-group/has-warning-feedback
- form-control/form-control-feedback

// button
type
- btn/primary/success
- btn-lg
- btn-group/btn-toolbar
- btn-group-sm/justified/vertical/

// Img
- img-responsive
- img-circle/rounded/thumbnail

// span
caret
text-hide
```

# JQuery

```js
$(fn);
// Dom操作：
$(str).children/find/parent/siblings/next/prev/:eq(index)/:odd/:even
$(str).click(fn)
$(str).text(str)
$(str).css(strs/obj).show/hide()
```

# Less

- 编译：lessc，easy less

```js
变量：@，@{ }
嵌套：&
混合：(@_)(A，@...)
```

# Sass

```js
// 数据类型
1. 字符串（引号_#{}）
2. 数字（单位）/布尔（false_null）
3. 数组（空格_逗号__括号）
4. 映射（括号_键值对）
5. 颜色（rgba(#hex,opacity)）
// 安装
Node安装node-sass/dart-sass
Ruby/Dart的sass模块
webstorm→配置自动命令→scss插件
vscode→Easy Sass和Sass插件
node-sass  scss  css
node-sass  c  -o  d
node-sass  -w  scss  -o  css
```

# ElementUI

# AntDesign

#### 按需加载

Layout布局

# iView

#### 全局配置

Vue.use(iView,{

​    size:"large",

​    transfer:false

})

#### 自定义主题配置

@import "~iview/src/styles/index.less"

@primary-color: ...

#### 国际化配置

import "iview/dist/locale/en-US"

import "iview/dist/locale/zh-CN"

import "vue-i18n"

Vue.use(VueI18n)

Vue.locale = ()=>{}

msg = {

​    en: Object.assign({ message:"" }, en),

​    zh: Object.assign({ message:"" }, zh),

}

}

new VueI18n({

​    locale:"en",

​    msg

})

new Vue({

​    render: h=> h(App),

​    i18n

})

使用：{{ $t("message") }}

#### iview-loader用法及配置

Button > i-button

#### babel-plugin-import按需加载

.babelrc{

​    "plugins":[["import",{

​        "libraryName":"iview",

​        "libraryDirectory":"src/components"    

​    }]]

}

import { Button } from "iview"

import ".css"

Vue.component('Button', Button)
