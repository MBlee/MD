## Next@15

```shell
# 手动安装
npm i next react react-dom
- mkdir public src/app
- echo. > (next-env.d.ts next.config.js) 
- baseUrl:'src/',paths:{'@/*'}
```

#### 组件

> **Server&Client**

```ts
// 模块通用
import 'server-only|client-only'
- fetch|React.cache // 共享数据
// 服务端转换客户端
- 'use client'
- export default (import)
- createContext({}) => <Provider value>{children}</Provider>
// 客户端包含服务端组件(不能导入)
- <Client><Server/></Client>
```

> **Appearance**

```ts
// 样式
1. next.config.js >>>
	sassOptions.additionalData
	sassOptions.implementation:'sass-embedded'
	:export{var:$var} => styles.var
2. npm i tailwindcss postcss @tailwindcss/postcss
	- post.config.mjs > /* @types {import('tailwindcss').config} */
      plugins:{'@tailwindcss/postcss':{}}
	- import 'tailwindcss'
// 图片
- next.config.js >>> 
    images:{
      remotePatterns:[{protocol,hostname,port,pathname,search}]
    }
// 字体
- Google
	import {geist,roboto} from 'next/font/google'
	geist({subsets:['latin']}).className
	roboto({weight}).classname
- local
	import localFont from 'next/font/local'
	localFont({src}).className
```

```ts
// Css-in-JS
```

#### 路由

```shell
# 路由匹配
- [[...dynamic]],(routeGroup),_private
- layout/template
- loading/error/not-found/page
- route
```

```ts
// 切换
- redirect('pathname') // next/na
vigation（仅渲染可用）
- <Link href={''|{}} as // next/link
	prefetch
    scroll
  /> 
- useRouter => pathname,query,push,prefetch
- usePathname => pathname
- useSearchParams => searchParams
- window.history.pushState/replaceState(null,'',path)
```

```ts
export async getServersideProps=({params})=>({props})
export async getStaticProps=({params})=>({props})
// 数据缓存
fetch('path',{cache:'force-cache'})
```

```ts
// 路由API
export async GET(req:Request)
export const dynamic = 'force-static'
export const revalidate = 60
// redirect
import { redirect } from 'next/navigation'
redirect('https://nextjs.org/')

// cookie
import {cookie} from 'next/headers'
const cookieStore = await cookies()
const token = await cookiesStore.get('token')
return new Response('hello',{status,headers:{'Set-Cookie':'token=${token.value}'}})
import { type NextRequest } from 'next/server'
const token = request.cookies.get('token')

// headers
import { headers } from 'next/headers'
const headersList = await headers()
const referer = headersList.get('referer')
return new Response('Hello, Next.js!', {
  status: 200,
  headers: { referer: referer },
})
import { type NextRequest } from 'next/server'
const requestHeaders = new Headers(request.headers)
```

```ts
// middleware
export middleware
export config = {matcher}
```

#### 数据

> **DataFetch**

```ts
// 数据获取
- await fetch,json() => cache(fetchFn)
- use(Promise)
	<Suspense> => <Server Promise/> => use(Promise)
	Promise.all()
	checkIsAvailable()
// 数据更新
- 'use server' => export async fetchData
- revalidatePath/Tag
- redirect
// 错误处理
- !res.ok > msg/comp/redirect
- notFound()
- error.ts => Error({error,reset})
- global-error => html,body
// Metadata和OGImages
- export metadata|generateMetadata(props,ResolvingMetadata)
- favicon.ico,opengraph-image.jpg
- export size|contentType
- export new ImageResponse(jsx)
```

> **Authentication**

```ts
/* STEP1: Authentication */
// 1.Capture

// 2.Validate

// 3.Check || Create
```

```ts
/* STEP2: Sessions(Stateless) */
// 1.SecretKey
- openssl rand -base64 32
- .env > SESSION_SECRET=key
- 
// 2.EncryptSession
import {SignJWT,jwtVerify} from 'jose'
import {SessionPayload} from '@/app/lib/definitions'
const secretKey = process.env.SESSION_SECRET
const encodedKey = new TextEncoder().encode(sercretKey)
export async function encrypt(payload: SessionPayload) {
  return new SignJWT(payload)
    .setProtectedHeader({ alg: 'HS256' })
    .setIssuedAt()
    .setExpirationTime('7d')
    .sign(encodedKey)
}
 
export async function decrypt(session: string | undefined = '') {
  try {
    const { payload } = await jwtVerify(session, encodedKey, {
      algorithms: ['HS256'],
    })
    return payload
  } catch (error) {
    console.log('Failed to verify session')
  }
}
// 3.SetCookies
import 'server-only'
import { cookies } from 'next/headers'
export async function createSession(userId: string) {
  const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000)
  const session = await encrypt({ userId, expiresAt })
  const cookieStore = await cookies() 
  cookieStore.set('session', session, {
    httpOnly: true,
    secure: true,
    expires: expiresAt,
    sameSite: 'lax',
    path: '/',
  })
}
export async function updateSession() {
  const session = (await cookies()).get('session')?.value
  const payload = await decrypt(session)
  if (!session || !payload) {
    return null
  }
  const expires = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000)
  const cookieStore = await cookies()
  cookieStore.set('session', session, {
    httpOnly: true,
    secure: true,
    expires: expires,
    sameSite: 'lax',
    path: '/',
  })
}
export async function deleteSession() {
  const cookieStore = await cookies()
  cookieStore.delete('session')
}
// 4.Redirect
import { createSession } from '@/app/lib/session'
export async function signup(state: FormState, formData: FormData) {
  await createSession(user.id)
  redirect('/profile')
}

// Sessions(Database)
import cookies from 'next/headers'
import { db } from '@/app/lib/db'
import { encrypt } from '@/app/lib/session'
export async function createSession(id: number) {
  const expiresAt = new Date(Date.now() + 7 * 24 * 60 * 60 * 1000)
  // 1. Create a session in the database
  const data = await db
    .insert(sessions)
    .values({
      userId: id,
      expiresAt,
    })
    // Return the session ID
    .returning({ id: sessions.id })
  const sessionId = data[0].id 
  // 2. Encrypt the session ID
  const session = await encrypt({ sessionId, expiresAt })
  // 3. Store the session in cookies for optimistic auth checks
  const cookieStore = await cookies()
  cookieStore.set('session', session, {
    httpOnly: true,
    secure: true,
    expires: expiresAt,
    sameSite: 'lax',
    path: '/',
  })
}
```

```ts
/* STEP3: Authorization */
// Middleware
import { NextRequest, NextResponse } from 'next/server'
import { decrypt } from '@/app/lib/session'
import { cookies } from 'next/headers'
// 1. Specify protected and public routes
const protectedRoutes = ['/dashboard']
const publicRoutes = ['/login', '/signup', '/']
export default async function middleware(req: NextRequest) {
  // 2. Check if the current route is protected or public
  const path = req.nextUrl.pathname
  const isProtectedRoute = protectedRoutes.includes(path)
  const isPublicRoute = publicRoutes.includes(path)
  // 3. Decrypt the session from the cookie
  const cookie = (await cookies()).get('session')?.value
  const session = await decrypt(cookie)
  // 4. Redirect to /login if the user is not authenticated
  if (isProtectedRoute && !session?.userId) {
    return NextResponse.redirect(new URL('/login', req.nextUrl))
  }
  // 5. Redirect to /dashboard if the user is authenticated
  if (
    isPublicRoute &&
    session?.userId &&
    !req.nextUrl.pathname.startsWith('/dashboard')
  ) {
    return NextResponse.redirect(new URL('/dashboard', req.nextUrl))
  }
  return NextResponse.next()
}
// Routes Middleware should not run on
export const config = {
  matcher: ['/((?!api|_next/static|_next/image|.*\\.png$).*)'],
}

// DAL
import 'server-only'
import { cookies } from 'next/headers'
import { decrypt } from '@/app/lib/session'
export const verifySession = cache(async () => {
  const cookie = (await cookies()).get('session')?.value
  const session = await decrypt(cookie)
  if (!session?.userId) {
    redirect('/login')
  }
  return { isAuth: true, userId: session.userId }
})
export const getUser = cache(async () => {
  const session = await verifySession()
  if (!session) return null
  try {
    const data = await db.query.users.findMany({
      where: eq(users.id, session.userId),
      // Explicitly return the columns you need rather than the whole user object
      columns: {
        id: true,
        name: true,
        email: true,
      },
    })
    const user = data[0]
    return user
  } catch (error) {
    console.log('Failed to fetch user')
    return null
  }
})

// DTO
import 'server-only'
import { getUser } from '@/app/lib/dal'
function canSeeUsername(viewer: User) {
  return true
}
function canSeePhoneNumber(viewer: User, team: string) {
  return viewer.isAdmin || team === viewer.team
}
export async function getProfileDTO(slug: string) {
  const data = await db.query.users.findMany({
    where: eq(users.slug, slug),
    // Return specific columns here
  })
  const user = data[0]
  const currentUser = await getUser(user.id)
  // Or return only what's specific to the query here
  return {
    username: canSeeUsername(currentUser) ? user.username : null,
    phonenumber: canSeePhoneNumber(currentUser, user.team)
      ? user.phonenumber
      : null,
  }
}

// Server component
import { verifySession } from '@/app/lib/dal'
export default function Dashboard() {
  const session = await verifySession()
  const userRole = session?.user?.role // Assuming 'role' is part of the session object
  if (userRole === 'admin') {
    return <AdminDashboard />
  } else if (userRole === 'user') {
    return <UserDashboard />
  } else {
    redirect('/login')
  }
}
  
// Layout check
export default async function Layout({
  children,
}: {
  children: React.ReactNode;
}) {
  const user = await getUser();
  return (
    // ...
  )
}
  
// Server action
'use server'
import { verifySession } from '@/app/lib/dal
export async function serverAction(formData: FormData) {
  const session = await verifySession()
  const userRole = session?.user?.role
  // Return early if user is not authorized to perform the action
  if (userRole !== 'admin') {
    return null
  }
  // Proceed with the action for authorized users
}
  
// APIRoute
import { verifySession } from '@/app/lib/dal'
export async function GET() {
  // User authentication and role verification
  const session = await verifySession()
  // Check if the user is authenticated
  if (!session) {
    // User is not authenticated
    return new Response(null, { status: 401 })
  }
  // Check if the user has the 'admin' role
  if (session.user.role !== 'admin') {
    // User is authenticated but does not have the right permissions
    return new Response(null, { status: 403 })
  }
  // Continue for authorized users
}
```

```shell
# libs
- zod,yup
- jose,iron session
- autho,nextauth.js
```

> **CSP**

```ts
// nonces
// withoutNonces
```

> **Cache**

```ts
// CI Caching
- .next/cache
```

> **Custom Server**

```ts
// app.prepare().then()
```

> **Env Variables**

#### Structure

> **构建**

```shell
pnpm i next react react-dom
eslint --init
ts --init
- mkdir public src/app
- echo. > (next-env.d.ts next.config.js) 
- baseUrl:'src/',paths:{'@/*'}
```

> **部署**

```shell
- next build & next start
```

#### Analysis

```ts
// 1. instrumentation-client.ts
- window:error => reportError(event.error)
```

```ts
// 2. _components/Webvitals.ts
- useReportWebVitals: metric=> report(metric)
	metric.name|value|id
- app => <Webvitals/>
```

#### Debug

```shell
# VSCode(launch.json)
- sever: command
- client: url
- fullStack: debugWithChrome
```

```shell
# Chrome(chrome://inspect)
- cross-env NODE_OPTIONS='--inspect' next dev
```

## Next@10

```shell
# create-next-app
npm init next-app <app>
yarn create next-app --typescript <app>
# 手动安装
yarn add next react react-dom
```

#### 组件

```ts
// SSR
- getServerSideProps=>{props}
// SSG|ISG
- getStaticProps=>{props,revalidate}
// CSR
- useEffect
- process.browser
- dynamic(()=>import('comp'),{ssr:false})
```

```ts
// 全局样式
_app.js => import '.css'
.xxx :global
// Style JSX
<style jsx global>{``}</style>
// Css.module
composes: classname;
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
```

#### 路由

```ts
// 动态|嵌套路由
- pages/[dynamic].tsx
// 获取动态参数
- getServerSideProps({params})
- getStaticProps({params})
```

```ts
// 组件路由
- useRouter().push('href'|{},'as')
- useRouter() => {pathname,query}
- <Link 
	href(passHref)=''|{pathname,query} as
	scroll
	preload
  >
```

```ts
// _document.tsx
- <Html><Head><body><Main><NextScript> 
- myDocument.getInitialProps:async(context)=>{
    const docProps = await Document.getInitialProps(context)
    return {...docProps}
}    
// _app.tsx
- ({Component,pageProps})=><Component {...pageProps}/>
- myApp.getInitialProps:async(context)=>{
    const appProps = await App.getInitialProps(context)
    return {...appProps}
}
// Head|Meta
- <PostMeta post/>
- <title key>
```

#### API

```ts
pages/api => export default (req,res)=>{res.send()}
```

#### Redux

```ts
// store.ts
const initStore=(preloadedState=initialState)=>(
	createStore(reducer,preloadedState,compose...)
)
const initializeStore=(preloadedState)=>{
    let _store = store??initStore(preloadedState)
    if(preloadedState&&store){
        _store=initStore({
            ...store.getState(),
            ...preloadedState
        })
    }
    if(typeof window==="undefined") return _store
    if(!store) store=_store
    return _store
}
const useStore=(initialState)=>(
	useMemo(()=>initializeStore(initialState),[initialState])
)
const useGlobalState=()=>(
	useSelector(state=>state,shallowEqual)
)
// _app.ts
const store = useStore(pageProps.initialReduxState)
<Provider store={store}/>
```

#### .....

#### 静态资源

###### 图像优化

```ts
// CLS(累积布局偏移)=>UX
// Next自动优化
- next.config.js=> images.domains:['imageDomain']
- <Image layout objectFit/> => (Wrapper)
// 外部服务器优化
- next.config.js=> images:{domains,loader:'akmai'|'imgix'|'cloudinary'}
- loader:({src,width,quality})=>`${src}?w=${width}&q=${quality||75}`
```

#### 配置

```shell
### SASS配置
# next.config.js
sassOptions:{
	outputStyle:"compressed"
}
```

```shell
### PostCSS配置
# post.config.json
"plugins":[
    "postcss-flexbugs-fixes",
    [
        "postcss-preset-env",
        {
            "autoprefixer":{ "flexbox":"no-2009" },
            "stage":3,
            "feature":{ "custom-properties":false }
        }
    ]
]
```

## 库

#### Headless-UI

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

#### TailwindCSS

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

## Configuration

> next@15

```ts
// next.config.ts
module.exports ={
	alloweDevOrigins:['local-origin.dev','*.lcoal-origin.dev'],
	assetPrefix:'https://cdn.mydomain.com',
    authInterrupts:true,
    basePath:'/html',
    compress:false,
    crossOrigin:'anonymous'
}
```

