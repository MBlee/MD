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

```js
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