## Next@13.4.9

```shell
# create-next-app
npm init next-app <app>
yarn create next-app --typescript <app>
# 手动安装
yarn add next react react-dom
```

#### 路由

>pages/[id].js|404.js

```js
// 路由跳转
import Link from 'next/link'
<Link> <a>
- href='/[id]'
- as={`/$id`}
// 路由头
import Head from 'next/head'
<> <Head> <link rel href> </Head> </>
```

> 样式

```js
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

> 数据

~~~js
// 静态生成
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
~~~

#### APIRoutes

~~~js
pages/api => export default (req,res)=>{res.send()}
~~~

#### 配置

<!--package.json-->

```shell
# next:9.4.4
# 导出发布
next build && next export
```

## Next

#### 路由跳转

**Link跳转**

~~~html
<link href(passHref)=''|{obj} as='' replace scroll>
~~~

**Js跳转**

~~~js
// 引入
import Router,{useRouter,withRouter} from 'next/router'
// 跳转
const router = useRouter()
router.push('href'|{},'as')
~~~

#### 路由传参|动态路由

**路由传参**

> - [Router.query]()

**动态路由**：

> - [[...id].js]() => [link+as]()

#### 预加载和错误路由

> [404.js]()，[_error.js]()

## 库

#### Chakra-ui

```shell
# 安装库
npm i @chakra-ui/react@^18
@chakra-ui/next-js@^14
@emotion/react@^11 
@emotion/styled@^11 
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
npm i @emotion/react@^11  @emotion/styled@^11  framer-motion@^6
# Emotion属性
npm i @emotion/babel-preset-css-prop
```

```shell
# .babelrc配置
"presets":["next/babel","@emotion/babel-preset-css-prop"]
# 0配置
/** @jsxImportSource @emotion/react */
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

#### ReactIcons

```shell
npm i react-icons@^3.10.0
```

```jsx
import {icon} from 'react-icons/..'
<icon />
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

