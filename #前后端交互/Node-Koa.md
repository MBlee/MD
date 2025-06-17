## Koa

```shell
- koa-onerror | koa-logger
- @koa/cors
- @koa/router
- @koa/multer
- koa-static | koa-mount
- koa-bodyparser | koa-params | koa-bouncer
- koa-session
```

```ts
// ctx
app.use(async (ctx,next)=>{
    ctx.redirect('')
    ctx.query|params|request.body
    ctx.status|statusCode
    ctx.body = 'hello'
})
// npm: koa-logger koa-onerror
app.use(logger())
onError(app)
```

```typescript
// npm: @koa/cors
app.use(Cors())
// npm: @koa/multer
const upload = multer({dest}|{
    storage:multer.diskStorage({
        destination:(req,file,cb)=>{
            cb(null,'upload')
        },
        filename:(req,file,cb)=>{
            cb(null,file.fieldname|originalname + Date.now())
        }
    })
})
app.use('/',   
      upload.single('avatar')
        .array('photos',maxCount)
        .fields([{name,maxCount}]),
    ctx=>{
        ctx.files|file
    }
)
// npm: koa-bodyparser
app.use(BodyParser())
ctx.request.body
// npm: koa-validate
// npm: koa-bouncer
app.use(Bouncer.middleware())
ctx
    .validateBody|Query|Params('filed')
    .check|checkNot(boolean,'msg')
    .required('msg')
    .isString()
    .trim()
    .isLength(min,max,'msg')
    .eq(ctx.vals.password,'')
    .match(/^$/i,'msg')
// cookies
ctx
    .cookies.set('key','value',{maxAge})
    .cookies.get('key')
// npm: koa-session
app.keys = ['secret'...]
app.use(session({
    key:'sid',
    maxAge:60000*60*24,
    httpOnly:true,
    signed:true
},app))
ctx.session.xx?
// npm: koa-jwt
const jwt = require('koa-jwt')({secret})
router.get('',jwt,async(ctx,next)=>{})
// npm: trek-captcha
captcha({size}) => {buffer,token}
// npm: svg-captcha
captcha.create({size}) => {data,text}
```

### 路由

```ts
// npm: @koa/router
const router = new Router()
router.prefix('/')
router.use|get|post('/',(ctx,next)=>...)
app.use(router.routes).use(router.allowedMethods)
// npm: koa-static koa-mount
app.use(mount('prefix',static(path)))
// npm: koa-compose glob
glob.sync(__dirname,'./','**/*.js')
.filter(d=>d.indexOf('index.js')===-1)
.forEach(r=>
         routers.push(r.routes())
         routers.push(r.allowedMethods())
)
compose(routers)
// 文件路由
const relative = path.relative(basePath,item)
const extname = path.extname(item)
const fileRoute = '/'+relative.split(extname)[0]
const key = '_'+method+'_'+fileRouter
routerMap[key]=handler
```
### 鉴权

#### JWT

```shell
# jsonwebtoken
- header(typ,alg)
- payload(data,exp)
- signature(h.p.s)
```

```ts
const {sign} = require('jsonwebtoken')
const jwtMd = require('koa-jwt')({secret})
const token = sign(data,secret,{expiresIn})
router.use(jwtMd,ctx=>{})
```

#### 单点登录

> 跨域SSO

```ts
// CAS客户端/服务端
1. CAS服务认证（query）
2. CAS创建Session，通行证。响应头返回SessionID，通行证→APPClient。
3. CAS返回XML用户信息（SessionID）→APPServer
4. APP2重定向CAS
5. CAS下发ST→APP2→CAS下发用户信息（token）→APP2（302，token）
```

> 授权协议OAuth2.0

### 数据存储

> mysql: (mysql2, sequelize, typeorm)

> redis

> elasticsearch

