## Emotion

#### Vitals

```shell
# CSSProps/Styled (either-or)
# Style/ClassName (dynamic)
# CSSInJS
# ThemeConst
```

#### Essentials

```ts
// CSSProps (facepaint)
// Keyframes
- div.css = {obj|[]|css``}
- Global.styles={selector}
- keyFrames``
// Styled
- styled.div<TProps>([{}],props=>...css)
- styled.div`key:${props=>...css}`
- styled(('div',{shouldForwardProp})``
- styled(({className})=>div)``
- Comp.withComponent('div')
```

## TailwindCSS

#### Vite

#### Next

#### V3.0

```shell
npm install -D tailwindcss
npx tailwindcss init
```

```shell
# tailwind.config.js
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
# package.json
"scripts": {
  "build": "tailwindcss -i ./src/main.css -o ./dist/output.css --watch"
}
```

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

#### V2.0

```shell
npm i -D postcss-cli
npm i tailwindcss@latest postcss@latest autoprefixer@latest
npx tailwindcss init
npm i cross-env -D
```

```shell
# postcss.config.js
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  }
}
# tailwind.config.js
module.exports = {
    purge: [
     './src/*.html',
    ],
    darkMode: false, // or 'media' or 'class'
    theme: {
      extend: {},
    },
    variants: {},
    plugins: [],
}
# package.json
"scripts": {
  "build": "postcss src/style.css -o dist/tailwind.css",
  "watch": "postcss build src/css/tailwind.css -o dist/css/tailwind.css --watch",
  "build:css": "cross-env NODE_ENV=production postcss src/css/tailwind.css -o dist/css/tailwind.css"
}
```

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

#### VUE安装

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

```shell
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

```shell
# postcss.config.js
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  }
}
# tailwind.config.js
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{html,js}"],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

~~~shell
# Vue集成
import 'tailwind.css'
# JIT模式
postcss tailwind.css -o style.css
~~~

组件封装：

## SCSS

```css
# node-sass
# sass-loader
```

编译插件：Live Sass Compiler > settings

嵌套：

- 选择器嵌套|&父选择器|属性嵌套
- 占位符选择器%xxx须通过@extend

~~~shell
# 变量
- $xxx-_xxx
- !global|!default
- (color1,color2) => map-get()
# 继承
@extend .xx
@extend %xx
# 插值
- #{$xx}
# 导入
@import "_"
- css|media query
- http://
- url()
@mixin xx($...)
- nth($,1)

@if >=3 and or not()
@if (varible|mixin-exists)
/* 函数 */
-. append(x1,x2),nth($list,$n),length|index
-. map-set(xx,x),map-has-key,map-keys|values
-. selector-append|unify + ''
~~~

## LESS

```shell
npm i less -g 
# cli
lessc xx.less xx.css
# Subl自动-less2css
npm install -g less-plugin-clean-css
npm install -g less-plugin-autoprefix
```

```shell
# 变量
@var:value => @{selector|key}
@min768:()
# 嵌套
&:hover
# 混合
.class(A,@params:default...)
# 继承
&:extend(class all)
# 避免编译
~"calc" => @media
```

## Stylus

```css
# stylus
# stylus -w xxx.styl -o xxx.css
```

选择器：

- 缩进 空格，逗号|换行
- 父级&，^[N]局部引用

## 原生CSS

```shell
# 继承
{
    composes: class;
}
```

