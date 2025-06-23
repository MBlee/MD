

```shell
#! 安装
npm create vite -- --template vue-ts <app>
```

## Assentials

### ASSETS

```ts
// ASSETS
/// <reference types="./vite-env-override.d.ts" />
/// <reference types="vite/client"/>
- import.meta.env
- import.meta.hot
import { field } from './example.json'
import imgURL from './img.svg'
import workletURL from 'worklet.js?url' // 显式URL
import imgUrl1 from './img.svg?no-inline|inline' // 显式内联
import shaderString from './shader.glsl?raw' // 显式字符串
const imgUrl = new URL('./img.png', import.meta.url).href
const modules = import.meta.glob('!./dir/*.js',{ 
  eager: true,
  import: 'setup'
}))
const module = await import(`./dir/${file}.js`)
```

```jsx
// HTML
<script vite-ignore type="module" src="cdn/main.js"></script>
```

```ts
- publicDir
- assetsInclude // 静态处理
- build.assetsInlineLimit:4096
```

### TS

```ts
/// <reference types="vite/client" />
- isolatedModules:true
- skipLibCheck:true
- useDefineForClassFields:true
```

```ts
// VUE|REACT
import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'
import react from '@vitejs/plugin-react'
```

```jsx
// CSS
import otherStyles from './bar.css?inline' // 样式不会注入页面
- css.preprocessorOptions[extension].additionalData
- css.devSourcemap
- build.cssTarget:['chrome61']
- build.cssMinify:"lightningcss"|"esbuild"
```

#### 全局配置

```shell
# 路径配置
- base  =>  import.meta.env.BASE_URL
- resolve.alias|extensions  => baseUrl & paths
# 环境变量(dotenv)
- envDir
- envPrefix
- import.meta.env.VITE
- loadEnv(mode,envDir,prefix)
```

```shell
# 合并配置
```

#### 本地服务器

```shell
- server
- preview
# 拦截器
# HTTPS服务器
1. npm i mkcert -g
- mkcert create-ca
- mkcert create-cert --domain localhost
- https:{
	cert:fs.readFileSync
	key:fs.readFileSync
}
2. npm i @vite/plugin-basic-ssl -D
- plugins:[BasicSSL()]
# 缓存
# SourceMap
```

#### 模块

```shell
# 模块依赖
- css.modules
- css.devSourcemap
- css.preprocessorOptions.[scss|less].additionalData:'@import'
- ...less.math:'always'
- ...less.globalVars
- css.postcss.plugins: [postcssPresetEnv({
	importFrom: '.css'
  })]
- postcss-global-data
# 外部依赖
# 资源模块
- import 'xx?raw|inline'
```

```shell
# 输入输出
- build.target:'modules|es2016|chrom58'
- build.outDir
- build.assetsDir
- build.assetsInlineLimite
- build.minify:'terser|esbuild'
- build.emptyDir
# 打包优化
- build.rollupOptions
  - output.assetsFileNames
```

```shell
# 插件
- @vitejs/plugin-legacy + terser
  legacy({
  	targets:['defaults','not IE 11']
  })
- vite-plugin-html
  createHtmlPlugin({
  	minify:true,
  	entry:'src/main.ts',
  	template:'index.html',
  	inject:{
  		data,
  		tags
  	}
  })
- vite-aliases
```

......

```shell
# 预构建 =>	1.转换ESModule	2.统一导出
- .vite/deps  =>  optimizeDeps.excludes
```

#### vue

#### react

#### ......

#### postcss

> npm: postcss  postcss-cli  postcss-preset-env

```shell
# postcss.config.js
plugins:[presetEnv()]
```

#### babel

## Plugins

```ts
/* vite.config.ts */
import {defineConfig} from 'vite'
defineConfig({    plugins:[]	})
/* plugin */
- ...plug()
- enforce:'pre|post'
- apply:'build|serve'
```

```ts
// @vitejs/plugin-legacy
- legacy({ targets:['defaults', 'not IE 11'] })
```

## CLI

```shell
# 开发
- vite --force
- vite dev|serve
# 构建
- vite build
- vite preview
```

## Configure

```ts
export default defineConfig({
  optimizeDeps:{
    include:['linked-dep']
  },
  build:{
    commonjsOptions:{
      include:[/linked-dep/,/node_modules/]
    }
  }
})
```

## Appendix

- ESM优化（预构建/解析、单模块、缓存、热替换）

- TS（转译选项、客户端类型）

- HTML（vite-ignore）

- 框架（@vitejs/plugin-{vue|react}-{jsx|swc}）

- JSX/TSX（esbuild.{ jsxFactory, jsxFragment, jsxInject}）


## ......

## REACT

```shell
# Deps
npm i vite @vitejs/plugin-react	react react-dom
# File
- vite.config.ts
- tsconfig.json
- index.html/main.tsx/vite-env.d.ts
```

## VUE