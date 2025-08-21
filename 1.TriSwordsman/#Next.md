## Next@15

```shell
# 手动安装
npm i next react react-dom
- mkdir public src/app
- echo. > (next-env.d.ts next.config.js) 
- baseUrl:'src/',paths:{'@/*'}
```

### 组件

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

#### Sass

```shell
- sassOptions.implemention
- sassOptions.addtionalData
```

#### ~CSS-in-JS

#### TailwindCSS

```shell
- plugins:['@tailwindcss/postcss']
```

#### ~Scripts

#### ^Videos

```ts
// <video> // React-player/Video.js
```

```ts
// <iframe> // <Suspense>
```

```ts
// Self-Hosted
import {list} from '@vercel/blob'
const {blobs} = await list({prefix,limit})
const {url} = blobs[0]
const {url:trackUrl} = blobs[1]
```

#### ^API

```ts
// DynamicAPI => Suspense
- fetch/{cache:'no-store'}
- cookies/headers/connection/searchParams
- draftMode/unstable_noStore
```

```ts
// Fetch
- fetch(url,opts)
- opts.cache:'force-cache'|'no-store'
- opts.next.revalidate:0|ns|false
- opts.next.tags:['caches']
- revalidatePath
- revalidateTag
// Cookies
- cookies.get|getAll|set|delete|clear
```

### 路由

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

#### ~Redirecting

### 数据

#### DataFetch

> 服务端

```ts
// Fetch
await fetch('',{cache}) => Suspense
```

```ts
// ORM/SQL
cache(await db.select())
```

```ts
// Streaming (dynamicIO)
- Loading.ts
- Suspense
// Parallel
- await Promise.all([f1,f2])
// Preloading
- cache
- preload (void)
- checkIsAvailable
```

> 客户端

```ts
// Use
- use(Promise) => res
```

```ts
// ReactQuery/SWR
- useSWR('url',url=>fetch(url)) => {data,error,isLoading}
```

```ts
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

#### DataSecure

```ts
- server-only
- taint
// HTTP API
const token = cookies().get('AUTH_TOKEN')?.value
await fetch('url',{headers:{Cookie:'AUTH_TOKEN=${token}'}})
// DAL/DTO
const DAL = cache(async()=>{
  const token = cookies.get('AUTH_TOKEN')
  const decodedToken = await decryptAndValidate(token)
  return new User(decodedToken.id)
})
const DTO = async(slug)=>{
  const userData = await sql``
  const user = await DAL
  return {
    xx:canSeeXx(user)?...
  }
}
// ServerComponent
const data = await sql``
return { xx:data.xx }
```

```ts
// ServerActions
- SecureID
- Closure/Encryption
  NEXT_SERVER_ACTIONS_ENCRYPTION_KEY
- experimental.serverActions.allowedOrigins
```

#### Authentication

```jsx
/* STEP1: Authentication */
// 1. 表单验证（{errors,message}|undefined=>bcrypt）
const schema = zod.z.object()
const valiFields = schema.safeParse({name,password})
if(!valiFields.success){
  return {
    error:valiFields.error.flatten().fieldErrors
  }
}
const hashedPwd = await bcrypt.hash(pwd,10)
// 2. 插入表单
const data = await db.insert()
if(!data) return {message}
```

```ts
/* STEP2: Sessions(Stateless) */
// Sessions(Database)
const data = await db.insert(sessions)
// 1. 设置密钥
- openssl rand -base64 32
- SESSION_SECRET=key
// 2. EncryptSession
function encrypt(payload: SessionPayload):SignJWT
function decrypt(session: string | undefined = ''):SessionPayload|null
// 3. SetCookies
function createSession(userId: string)
function updateSession()
function deleteSession()
// 4. Redirect
await createSession(user.id)
redirect('/profile')
```

```ts
/* STEP3: Authorization */
// Middleware
NextResponse.redirect(new URL('', req.nextUrl))
export const config = {
  matcher:['/((?!api|_next/static|_next/image|.*\\.png$).*)']
}
// DAL
function verifySession():{isAuth,userID}
function getUser():user|null
// DTO
function getProfileDTO(slug: string):{username:'':null}

// Layout check
await getUser();
// Server component
await verifySession().user.role
// Server action
await verifySession()
// APIRoute
await verifySession()
```

```shell
# libs
- zod,yup
- jose,iron session
- autho,nextauth.js
```

#### ^FormAction

```ts
- Object.fromEntries(formData)
// 表单传参
- input.hidden
- action.bind(null,pars)
// 表单验证
- required,type
- zod => useActionState => useFormStatus
```

#### CSP

```ts
// Content-Security-Policy (meta|headers)
- nonces
- withoutNonces
```

#### Cache

```ts
// Request/FetchData/Routes-Server
- fetch (rsc/get)
- cache
// Routes-Client
- prefetch|router.prefetch
```

```ts
// 禁用
- export const dynamic|fetch-cache
- revalidate...
- router.refresh
- dynamicAPI
```

#### ^Custom Server

```ts
// app.prepare().then()
```

#### ^Env Variables

```ts
// 运行时ENV
import {loadEnvConfig} from '@next/env'
loadEnvConfig(process.cwd())
// 浏览器ENV
NEXT_PUBLIC_
// ENV顺序
process.env/.env.local/.env.${NODE_ENV}/.env
```

#### ^DraftMode

```ts
const draft = await draftMode()
draft.enable()
const url = url?secret&slug
if(secret=='mysecret') redirect(post.slug)
draft.isEnabled?...fetch
```

#### ^Backend

#### ~Internationalization

#### ~JSON-LD

#### ~LazyLoading

#### ~Prefetching

#### ~SelfHosting

### Structure

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

#### ~DevEnvironment

#### ~CIBuildCaching

#### ISR

```ts
// RouteSegment
- dynamicParams
- generateStaticParams
- revalidate
// Function
- revalidatePath
- revalidateTag
```

#### ~MDX

#### ~Memory

#### ~MultiTenant

#### ~MultiZones

#### PackageBundling

```ts
// npm: @next/bundle-analyzer
// ANALYZE=true pnpm build
require('@next/bundle-analyzer')({
	enabled:process.env.ANALYZE === 'true'
})(nextConfig)
```

```ts
// next.config.ts
- experimental.optimizePackageImports:['lib']
- serverExternalPackages:['lib']
```

#### ~Production

#### ~PWAs

#### SPAs

```ts
// context/promise(server) => use(client)
// useSWR/useQuery
// dynamic(()=>import('comp'),{ssr:false})
// output:'export'
```

#### StaticExports

```ts
// output:'export'

```



#### ^CICache

```ts
// CI Caching
- .next/cache
```

#### ~CLI

### Analysis

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

#### ~Instrumentation

#### ~OpenTelemetry

#### ~ThirdParty

### Debug

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

#### ~Cypress

#### ~Jest

#### ~Playwright

#### ~Vitest

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

```ts
- experimental.dynamicIO // use cache/cacheTag/cacheLife
- experimental.serverActions.allowedOrigins
```

```shell
# ts
- experimental.typedRoutes
- typescript.ignoreBuildErrors
```

