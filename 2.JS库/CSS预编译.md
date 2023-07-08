#### Emotion

安装配置：

`npm i @emotion/core @emotion/styled`

~~~js
/** @jsx jsx */
import {jsx} from '@emotion/core'
~~~

`npm i @emotion/babel-preset-css-prop`

~~~js
package.json => "babel":{
  "presets":["react-app","@emotion/babel-preset-css-prop"]
}
~~~

#### TailwindCSS

安装配置：

~~~shell
npx tailwindcss init -p
# Vue集成
import 'tailwind.css'
# JIT模式
postcss tailwind.css -o style.css
~~~

组件封装：

#### SCSS

编译插件：Live Sass Compiler > settings

嵌套：

- 选择器嵌套|&父选择器|属性嵌套
- 占位符选择器%xxx须通过@extend

~~~scss
$变量
- $xxx-_xxx
- !global|!default
- (color1,color2) => map-get()
插值：#{$xx}
@import"_"
- css|media query
- http://
- url()
@mixin xx($...)
- nth($,1)
@extend %xx
@if >=3 and or not()
@if (varible|mixin-exists)
/* 函数 */
-. append(x1,x2),nth($list,$n),length|index
-. map-set(xx,x),map-has-key,map-keys|values
-. selector-append|unify + ''
~~~

#### LESS

#### Stylus

```shell
# 安装
npm install stylus -g
# 用法
stylus -w xxx.styl -o xxx.css
```

选择器：

- 缩进 空格，逗号|换行
- 父级&，^[N]局部引用
