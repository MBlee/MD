## VUE3通用

```json
/* tsconfig.json */
{
  "compilerOptions": {
    "target": "ESNext",
    "useDefineForClassFields": true,
    "module": "ESNext",
    "lib":["ESNext","DOM","DOM.Iterable"],
    "skipLibCheck": true,
    "esModuleInterop": true,

    /* Bundler mode */
    "moduleResolution": "Node",
    "allowImportingTsExtensions": true,
    "allowSyntheticDefaultImports": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "noEmit": true,

    /* Linting */
    "strict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "erasableSyntaxOnly": true,
    "noFallthroughCasesInSwitch": true,
    "noUncheckedSideEffectImports": true,

    "allowJs": true,
    "baseUrl": ".",
    "paths": {
      "@/*":["src/*"],
      "#/*":["types/*"]
    }
  },
  "include": [
    "src/**/*.ts",
    "src/**/*.d.ts",
    "src/**/*.tsx",
    "src/**/*.vue",
  ],
  "references": [{
    "path": "./tsconfig.node.json"
  }]
}
/*tsconfig.node.json*/
{
  "compilerOptions": {
    "module": "ESNext",
    "skipLibCheck": true,
    "moduleResolution": "Node",
    "composite": true,
    "allowSyntheticDefaultImports": true,
  },
  "include": [
    "vite.config.ts"
  ]
}
```

```ts
/*typings.d.ts*/
declare module '*.vue'{
    import { DefineComponent } from "vue";
    const component:DefineComponent<object,object,any>
    export default component
}
/*package.json*/
    "ts": "vue-tsc --noEmit"
```

```shell
yarn add @types/node -D
```

```ts
/*vite.config.ts*/
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import path from 'path'
// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve:{
    alias:{
      '@':path.resolve('./src'),
      '#':path.resolve('./types')
    }
  }
})
```

```shell
# ESLint/Prettier
yarn add eslint 
eslint-plugin-vue 
@typescript-eslint/parser 
@typescript-eslint/eslint-plugin 
eslint-plugin-prettier 
eslint-config-prettier 
prettier
```

```json
/* .eslintrc */

```



## Web管理系统

## 秒建

<!-- Vue2-Cli3 -->

```shell
vue create <app>
npm i axios vuex vue-router
```

```shell
# .editorconfig
# .prettierrc
# .prettierignore
# .eslintrc.js
```

```shell
# api/index.js 
# store/index.js
# router/index.js
# css/base.js
```

```shell
# 跨域
devServer.proxy => '/api',{
	target,changeOrigin,
	pathRewrite:{'^/api':''}
}
# 环境变量
.env|.env.development|.env.production => VUE_APP_
=> process.env.VUE_APP_
=> BASE_URL|NODE_ENV
```

~~~shell
# 别名
vue.config.js => configureWebpack.resolve.alias
vue.config.js => defineConfig({})
~~~

<!-- Vue3-cli3 -->

## Vue2商城

#### TabBar

#### 导航栏

#### 轮播图

#### 推荐图

#### TabControl

#### BScroll+BackTop

#### 上拉加载+下拉刷新

