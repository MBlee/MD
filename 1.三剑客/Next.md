## Next@13.4.9

#### 内置组件

```jsx
import Link from 'next/link'
<Link href><a ...></link>
import Head from 'next/head'
<> <Head> <link rel href> </Head> </>
```

#### 路由

~~~js
pages ([id].js|404.js) => export default cmt(props) =>
// 静态数据
- getStaticProps => ({props: _data})
- getStaticPaths => ({paths: [{params},....], fallback:false})
- getServersideProps => ({})

// 内部样式
<style jsx>{``}</style>
// 全局样式
_app.js => import '.css'
export default function App({Component,pageProps}){
  return <Component {...pageProps}/>
}
~~~

#### API

~~~js
api => export default (req,res)=>{res.send()}
~~~

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

## Chakra-ui

```css
# npm i @chakra-ui/react@^1 @emotion/react@^11 @emotion/styled@^11 framer-motion@^6
# npx chakra-cli init --theme
```

```jsx
// _app.js配置
import {ChakraPorvider,CSSReset,extendTheme} from "@chakra-ui/react"
({Component,pageProps})=>
<ChakraProvider theme={theme}>
  <CSSReset />
  <Component {...pageProps}>
</ChakraProvider>
```

```js
// 导入
import {Box,Container} from '@chakra-ui/react'
```

```jsx
// 公用
- w|h|maxW|maxH|pos
- spacing
- justifyContent|alignItems
- color|bgColor|border
// 组件
<Box> <Container> <HStack>
<Image> <Text>
<Heading as={h2} size={large}>
<Button leftIcon={</>}>
```

## Emotion

```css
# @emotion/react@^11  @emotion/styled@^11  framer-motion@^6
# @emotion/babel-preset-css-prop
```

```css
# .babelrc配置
"presets":
["next/babel","@emotion/babel-preset-css-prop"
# 0配置
/** @jsxImportSource @emotion/react */
```

```jsx
import {css} from '@emotion/react'
import styled from '@emotion/styled'
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

## ReactIcons

```css
# react-icons
```

```jsx
import {icon} from 'react-icons/..'
<icon />
```

## 小组件库

> 轮播图

```css
# react-responsive-carousel
```

```jsx
import {Carousel} from "react-responsive-carousel"
import "~/lib/styles/carousel.min.css"
<Head> <link></link> </Head>
```

## 秒建

```shell
npm init next-app <pro>
```

