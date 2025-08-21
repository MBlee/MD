#### 服务器

```ts
// HTTP服务器
const express = require('express')
const app = express()
app.listen(_port)
app.use((req,res,next)=>...)
// 跨域
const cors = require('cors')
app.use(cors())
// 静态服务器
app.use(baseURL,express.static('path'))
// 路由
app.use(baseURL,routes)
// 错误处理器
app.use((req,res,next)=>{
  next(httpErrors(404,'NOTFOUND')|'route')
})
app.use((err,req,res,next)=>{
  // Error Logger
  console.error(err.stack)
  next(err)
  // Client Error
  if (req.xhr) {
    res.status(500).send({ error: 'Something failed!' })
  } else {
    next(err)
  }
  // Res Error
  if (res.headersSent) {
    return next(err)
  }
  res.status(500).send(err)
})
```

```ts
// 错误调试（debug）
const debug = require('debug')('symbol')
SET DEBUG=*
// 错误调试（morgan）
app.use(require('morgan')(<formate>,opts))||morgan('combined')(req,res,err=>...)
- formate:'combined|common|dev|tiny'
	':method :url :status'
	':res[content-length] - :response-time ms'
- opts.stream: 'npm:rotating-file-stream'
- opts.skip: (req,res)=> res.statusCode<400
// 错误生成器（@hapi/boom）
const Boom = require('@hapi/boom')
Boom.isBoom(err)
new Boom(err,{statusCode,err,message})
Boom.boomify(err)
Boom.badRequest(err,data)
```

```ts
// express-validator
const {query,body,validationResult,matchedData} = require('express-validator')
app.use(path,
    query('xx')
    .notEmpty()
    .escape()
    .trim()
    .isEmail()
)
app.use((req,next)=>{
    const err = validationResult(req)
    if(!err.isEmpty()) next(err.array())
    const [{msg}] = err.errors
    next(Boom.badRequest(msg))
})
// 国际化（i18n）
// body-parser
const bodyParser = require('body-parser') => req.body
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended:true}))
// multer
const multer = require('multer') => req.file|files|body
multer({
    dest|storage:{
        destination:(req,file,cb)=>cb(null,'dest'),
        filename:(req,file,cb)=>cb(null,'filename')
    },
    limits:{filesize},
    fileFilter:(req,file,cb)=>cb(null,false|err)
})
```

```jsx
// cookie
const cookieParser = require('cookie-parser')
app.use(cookieParser('signed'))
req.cookies|signedCookies.key
res.cookie(key,value,{maxAge,signed,domain,path,httpOnly})
// session
const session = require('express-session')
const MongoStore = require('connect-mongo')(session)
app.use(session({
    secret:'secStr',
    name:'cookieName',
    cookie:{maxAge,secure},
    rolling:true,
    resave:false,
    saveUninitialized:true,
    store: new MongoStore({
        url:'',
        mongoOptions
    })
}))
req.session.username = 'str' // 设置
req.session.username = '' // 清除
req.session.cookie.maxAge=0 // 销毁
req.session.destroy(err=>...) // 销毁
// jsonwebtoken
const jwt = require('jsonwebtoken')
const token = jwt.sign({exp,data},secretKey,{
    expiresIn:'1h'
})
const deToken = jwt.vertify(token,secretKey,(err,data)=>...)
```

<!--服务器请求-->

```js
const options = {
    headers:{'Connection':'close'},
    url,method,
    json:true,
    body
}
const callback = (err,res,data)=>{
    if(!err && res.statusCode == 200){
        res.json(data)
    }
}
http.request(options,callback)
```

#### 路由

```js
// express.Router()
const router = express.Router()
router.use((req,res,next)=>{})
router.all(path,(req,res)=>{})
// express()
app.all(path/:id,(req,res,next)=>...)
- 'path/:a(\\d)'
- 'path/:a.:b'
- 'path/:a-:b'
- /^.$/
// req
req.params['id']
req.query
req.body
// res
res.send()|sendStatus()|status()
```

#### 模板引擎

```js
const ejs = require('ejs')
app.engine('html',ejs.__express)
app.set('view engine','html|ejs')
app.set('views',__dirname+'/views')
res.render('index',{})
```

```ejs
<%=text%>
<%-html%>
<%-include('.ejs')%>
<%if(){%>...<%}%>
<%for(){%>...<%}%>
```

#### ......

#### 脚手架

> npm: express-generator

```shell
express --no-view <proname>
npm i
```

## 