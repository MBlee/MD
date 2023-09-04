## Next@13.4.9

#### 路由

~~~js
pages ([id].js|404.js) => export default cmt(props) =>
import Link from 'next/link'
<Link href><a ...></link>
import Head from 'next/head'
<> <Head> </>

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
# @chakra-ui/core@next
npx chakra-cli init --theme
```

```jsx
// _app.js配置
import {ChakraPorvider,CSSReset} from "@chakra-ui/core"
import theme from "../chakra"
({Component,pageProps})=>
<ChakraProvider theme={theme}>
  <CSSReset />
  <Component {...pageProps}>
</ChakraProvider>
```

```js
// 导入
import {Box,Container} from '@chakra-ui/core'
```

```jsx
// 公用
- w|h|maxW|maxH|pos
- bgColor|border
// 组件
<Box> <Container>
<Image>
<Button leftIcon={</>}>
```

## ReactIcons

```css
# react-icons
```

```jsx
import {icon} from 'react-icons/..'
<icon />
```

## Emotion

```css
# @emotion/core @emotion/styled
# @emotion/babel-preset-css-prop -S
```

```shell
# .babelrc配置
"presets":
["next/babel","@emotion/babel-preset-css-prop"
```

```jsx
import {css} from '@emotion/core'
import styled from '@emotion/styled'
const className = css`...css` => css={classname}
const component = styled.div`` => <component/>
```

## 秒建

```shell
npm init next-app <pro>
```

