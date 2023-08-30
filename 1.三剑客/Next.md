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

## 秒建

```shell
npm init next-app <pro>
```

> Chakra-ui

```shell
npm install @chakra-ui/core@next
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

> Emotion

```shell
# emotion
npm install react-icons @emotion/core @emotion/styled
npm install @emotion/babel-preset-css-prop -S
```

```shell
# .babelrc配置
"presets":
["next/babel","@emotion/babel-preset-css-prop"]
```