## Vitals

## Assential

```ts
// NestAPP
- NestFactory.create<NestExpressApplication>(appModule)
- abortOnError
- -- -b swc

// Modules
@Global@Module({
  controllers,providers,exports
  imports
})
class DynamicModule{
  static forRoot()=>{ module,providers,exports }
}
    
// Controllers 
@Controller('prefix')
@All('route')
@Res({passthrough})@Req@Next@Redirect
@Host...

// Providers
@Injectable@Inject('HTTP_OPTIONS')
@Optional
```

```ts
// Middleware
@Injectable() class Mid implements NestMiddleware{ use }
class Mod implements NestModule{ configure(consumer:MiddlewareConsumer) }
consumer.apply(Mid).exclude({path,method}).forRoutes(controller)
app.use(Mid)
// Exception filters
class Forbidden extends HttpException/BadRequestException
throw new HttpException(Res,HttpStatus,{cause}) => {error,status}

@Catch(HttpException) class Filter implements ExceptionFilter{ catch }
catch(exception:HttpException,host:ArgumentsHost)
const ctx = host.switchToHttp()
const res = ctx.getResponse<Response>()
const req = ctx.getResponse<Request>()
const status = exception.getStatus()
res.status(status).json({statusCode,path})

@UseFilters(Filter)
app.useGlobalFilters(Filter)
```

```ts
// Pipes
```

```ts
// Guards
```

```ts
// Interceptors
```

```ts
// Decorators
```

```ts
// app.module.ts
import {Module} from '@nestjs/common'
@global()
@Module({
	imports:[modules...],
    controllers:[controllers...],  
    providers:[service...],
  	exports:[modules|services...]
})
class Module{
  constructor(private service:Service){}
}
// 路由：xx.controller.ts
import { Controller...} from '@nestjs/common'
@Controller('route')=> constructor(private service:Service)
@Get(':route')
@Req(uest)?|Res(ponse)?({passthrough:true})
@Params|Query|Body|Session
@Request.signedCookies|@Response.cookie
@Request.session
@Headers('name')
@Ip|HostParam
@Next
@HttpCode(204)
@Header(key,value)
@Redirect(url,301)
// 路由处理器：xx.service.ts
@Injectable|Inject => private service:Service
// 管道：xx.pipe.ts
@Injectable() => PipeTransform => @UsePipes(new XPipe())
transform(value:any,metadata:ArgumentMetadata)=> value
// 守卫：xx.guard.ts
import {Observable} from 'rxjs'
@Injectable() => CanActivate => @UseGuards(AuthGuard)
canActivate(context:ExecutionContext):boolean|Promise<Boolean>|Observable<boolean> => context.switchToHttp().getRequest().session
app.useGolobalGuards(new AuthGuard())
```

```ts
// 路由中间件
// 创建
@injectable()
class Logger implements NestMiddleware{
  use(req:Request,res:Response,next:Function){
    next()
  }
}
// 应用
class AppModule implements NestModule{
  configure(consumer:MiddlewareConsumer){
    consumer
      .apply(Logger...)
      .excludes(...)
      .forRoutes({path,method:RequesMethdod.ALL},
                'path/(.reg)',Controller...)
  }
}
```

```ts
// 异常过滤器
throw new HttpException('forbidden',HttpStatus.FORBIDDEN,{cause,description})
```

```ts
// main.ts
import {NestFactory} from '@nestjs/core'
import {NestExpressApplication} from '@nestjs/platform-express'
const app = await NestFactory.create<NestExpressApplication>(AppModule)
// 静态目录
app.useStaticAssets(join(__dirname,'..','public'),{prefix})
// 模板引擎
app.setBaseViewsDir(join(__dirname,'..','views'))
app.setViewEngine('hbs') => @Render('views')
await app.listen(3000)
// 全局中间件
app.use(Logger)
// 文件上传
>>>@types/multer>>>Express.Multer.File
>>>MulterModule.register(Async)?({dest|useFactory()=>{dest}})
@Post('upload')
@useInterceptors(
  FileInterceptor('file'|{name,maxCount}),{dest}
  |AnyFilesInterceptor|NoFilesInterceptor
)
uploadFile(@uploadedFiles?() files?:Express.Multer.File){
  const writeStream = createWriteStream('path')
  writeStream.write(file.buffer)
}
```

```ts
// Mongoose数据库
// @nestjs/mongoose mongoose
>>> app.module.ts //数据库连接
import {MongooseModule} from '@nest/js/mongoose'
@Module({
  imports:[MongooseModule.forRoot('mongodb://host/nest')]
})
>>> schema //数据表
import * as mongoose from 'mongoose'
export new mongoose.Schema({...})
>>> child.module.ts //数据库操作
@module({
  imports:[MongooseModule.forFeature(models?:{name,schema,collection?}[],connectionName?:string):DynamicModule]
})
>>> xx.service.ts
constructor(@InjectModel('Article') private readonly articleModel) => this.articleModel.find().exec()
```

## Cli

```shell
# npm i @nestjs/cli -g
nest new <app> -p pnpm
nest g resource|module|controller|provider|service
# 打包
nest build
	--path <tsconfig-path>
	--watch
	--builder <tsc|webpack|swc>
# 调试
- nest start -d|--debug 8088 --watch
=> chrom://inspect
- vscode => Toggle Auto Attach
- lanch.json => Program
```

## Conf

```shell
# nest-cli.json
- $schema:"https://json.shemastore.org/nest-cli"
- collection:"@nestjs/schematics"
- sourceRoot:'src'
- generateOptions:{ flat,spec }
- compilerOptions:{
  'webpack':false, 'deleteOutDir':true,
  "builder":'tsc',
  "watchAssets":false
}
```

