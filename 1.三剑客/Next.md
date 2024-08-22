## Next@15

#### 路由

> layout.tsx|template.tsx, page.tsx

```ts
// 动态|嵌套路由
- app/[dynamic]/page.tsx
```

```ts
// 导航：next/navigation
- <Link href={''|{}} as 
	prefetch
    scroll
  />
- redirect('pathname')
- useRouter => pathname,query,push,prefetch
- usePathname => pathname
```

```ts
export async getServersideProps=({params})=>({props})
export async getStaticProps=({params})=>({props})
// 数据缓存
fetch('path',{cache:'force-cache'})
```

## Next@11

```shell
# create-next-app
npm init next-app <app>
yarn create next-app --typescript <app>
# 手动安装
yarn add next react react-dom
```

#### 路由

```ts
// 动态|嵌套路由
pages/[dynamic].tsx
```

```ts
- <Link href(passHref)=''|{obj} as
	scroll
	preload
  >
- useRouter().push('href'|{},'as')
- useRouter() => {pathname,query}
```

```ts
_document.tsx =>
    <Html><Head><body><Main><NextScript> 
_app.tsx =>
	({Component,pageProps})=><Component {...pageProps}/>
// Meta
```

```ts
// 静态数据
export async getStaticProps({params}) => ({
    props: _data
})
export async getStaticPaths() => ({
    paths: [{params},....], 
    fallback:false
})
// 服务端渲染
export async getServersideProps(context) => ({
    props: _data
})
// 内部样式
<style jsx>{``}</style>
// 全局样式
_app.js => import '.css'
export default function App({Component,pageProps}){
  return <Component {...pageProps}/>
}
// classnames
cn({
    [styles.xx]:true
})
```

#### API

```ts
pages/api => export default (req,res)=>{res.send()}
```

## 库

#### Chakra-ui

```shell
# 安装库
npm i @chakra-ui/react@^18
@chakra-ui/next-js@^14
@emotion/react@^11 
@emotion/styled@^11
@emotion/babel-plugin^11
framer-motion@^11
# 安装主题
npx chakra-cli init --theme
```

```jsx
// pages配置
- _app.js>>
import {ChakraPorvider,CSSReset,extendTheme} from "@chakra-ui/react"
import {Box,Container} from '@chakra-ui/react'  
({Component,pageProps})=>
    <ChakraProvider theme={theme}>
      <CSSReset />
      <Component {...pageProps}>
    </ChakraProvider>  
```

```js
// app配置
- app/providers.tsx>>
    
'use client'
import { ChakraProvider } from '@chakra-ui/react'
export function Providers({ children }: { children: React.ReactNode }) {
  return <ChakraProvider>{children}</ChakraProvider>
}

- app/page.tsx>>
    
import { Providers } from './providers'
export default function RootLayout() {
  return (
        <Providers>{children}</Providers>
  )
}
```

> 常用属性

```js
// 布局
- pos
- w|h|maxW|maxH
- mx|px
- spacing
- justifyContent|alignItems
// 样式
- color|bgColor
- border|borderBottom
```

> 常用组件

```jsx
// 组件
<Box> <Container> <HStack>
<Image> <Text>
<Heading as={h2} size={large}>
<Button leftIcon={</>}	colorScheme='red'>
```

#### Emotion

> 安装配置

```shell
# Emotion核心库
npm i @emotion/react@^11  @emotion/styled@^11  @emotion/babel-plugin^11 framer-motion@^11
# Emotion属性
npm i @emotion/babel-preset-css-prop
```

```shell
# 属性配置.babelrc
"presets":["next/babel","@emotion/babel-preset-css-prop"]
# 0配置
- /// <reference types="@emotion/react/types/css-prop" />
- /** @jsxImportSource @emotion/react */
- tsconfig.json
	jsxImportSource:@emotion/react
	types:["@emotion/react/types/css-prop"]
```

> 组件

```js
// 导入
import {css} from '@emotion/react'
import styled from '@emotion/styled'
```

```jsx
// 样式类属性
const className = css`
	${props=>({...css})}
	${cmp} {...css}
`
const className = css({...css},props=>({...props.css}))
// 样式组件
const component = styled.div`
	${props=>({...css})}
`
const component = styled(cmp)`` => <cmp className={props.className}/>
```

#### 小组件库

> 轮播图

```shell
npm i  react-responsive-carousel@^3.2.9
```

```jsx
import {Carousel} from "react-responsive-carousel"
import "~/lib/styles/carousel.min.css"
<Head> <link></link> </Head>
```

## SSR

#### 安装配置

```shell
npm i react react-dom @babel/core @babel/preset-env @babel/preset-react babel-loader
```

<!--package.json-->

```js
// 服务器打包运行
"dev:server-build":"webpack --config webpack.server.js --watch"
"dev:server-run":"nodemon --watch build --exec \"node build/bundle.js\""
// 客户端打包
"dev:client-build":"webpack --config webpack.client.js --watch"
```

<!--webpack.server.js-->

```js
const path = require('path')
module.exports= {
	mode:'development',
    target:'node',
    entry:'./server',
    output:{
        path:path.join(__dirname,'build'),
        filename:'bundle.js'
    },
    module:{
        rules:[]
    }
}
// module.rules
{
    test:/\.js$/,
    exclude:/node_modules/,
    use:{
        loader:'babel-loader',
        options:{
        	presets:['@babel/preset-env','@babel/preset-react']
        }
    }
}
```

<!--webpack.client.js-->

```shell
module.exports= {
	mode:'development',
    entry:'./client',
    output:{
        path:path.join(__dirname,'public'),
        filename:'bundle.js'
    }
}
```

#### 服务端渲染

```js
import {renderToString} from 'react-dom/server'
const html = renderToString(<App/>)
res.send(`<html/>`)
```

#### 客户端渲染

```js
import ReactDOM from 'react-dom'
ReactDOM.hydrate(<App/>,#root)
```

