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