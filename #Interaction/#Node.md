## 🚀Vitals

#### Websocket

🚗npm: @nestjs/websockets @nestjs/platform-socket.io

```ts
//🚗🚗
```

#### Microservices

🚗npm: @nestjs/microservices

```ts
//🚗🚗
import { Transport, MicroserviceOptions } from '@nestjs/microservices';
const app = await NestFactory.createMicroservice<MicroserviceOptions>(
  AppModule,{
    transport: Transport.TCP,
  },
);
await app.listen();
```

#### Graphql

🚗npm: @nestjs/graphql @nestjs/apollo @apollo/server @as-integrations/express5 graphql

```ts
//🚗🚗CODE
import { GraphQLModule } from '@nestjs/graphql';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
@Module({
  imports: [
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      playground: false,
    }),
  ],
})
```

```ts
//🚗🚗SCHEMA
```

## 🚀Assential

#### MVC

```ts
//🚗Controller
@Controller(<Prefix>/{host})
@Method(<Path>)
@Req@Res({passthrough})@Next
@Body@Param@Query
@Headers@Session@Ip@HostParam
@HttpCode(<Code>)@Header(<key>,<Val>)
@Redirect(<Path>,<Code>)
            
//🚗Service
@Injectable({scope:Scope.REQUEST/TRANSIENT})
=> constructor(private prov)
=> constructor(@Optional @Inject(<Val>) private prov)
=> @Inject(<Val>) private readonly prov
=> @Inject(REQUEST) req:Request
=> @Inject(ModuleRef) => mRef.get(P)
=> @Inject(forwardRef(()=>Provider/Module))
           
//🚗Module
@Global@Moudule({
	imports,exports,
	controllers,providers
})
static forRoot(entities):DynamicModule{
	return {
		global,module,
        exports,providers
	}
}
//🚗LazyModule
constructor(private LazyModuleLoader)
await import('lazy.module/service')
const moduleRef = loader.load(()=>lazyModule)
moduleRef.get(LazyService)
```

```ts
//🚗ExecutionContext(ArgumentsHost)
ctx.getType|getArgs
reflector.get(Roles,ctx.getHandler())
ctx.switchToHttp.getRequest
ctx.switchToRpc/Ws.getData
ctx.getClass/getHandler
//🚗Situation
catch(exception,ArgumentsHost)
createParamDecorator((data,ExecutionContext)=>{})
canActivate(ExecutionContext)
intercept(ExecutionContext,next)
//🚗Real
const req = context.switchToHttp().getRequest();
const user = req.user;
const roles = this.reflector.get(Roles, context.getHandler());
reflector.get(Roles, context.getClass())
reflector.getAllAndOverride(Roles, [
  context.getHandler(),
  context.getClass(),
]);
```

```ts
//🚗LifeCycle(listen/close)
- OnModuleInit => initDB
- OnApplicationBootstrap => loadCache => scheduler
- OnModuleDestroy 
- BeforeApplicationShutdown
- OnApplicationShutdown => shotdown(signal)
app.enableShutdownHooks()
```

#### AOP

```ts
//🚗Middleware
export class mw implements NestMiddleware{
  use(req:Request,res:Response,next:NextFunction){}
}
app.use(mw)
✅class MD implements NestModule
=> configure(consumer:MiddlewareConsumer)
=> consumer.apply(mw...).forRoutes({path,method},...).exclude()

//🚗HttpException
throw new HttpException(res,HttpStatus.FORBIDDEN,{cause})
new BadRequestException(res,{cause,description})
class Cust Extends HttpException
✅@Catch(HttpException)=>implements ExceptionFilter
=> catch(HttpException,ArgumentsHost)
=> host.switchToHttp().getResponse/getRequest
=> exception.getStatus()
✅@UseFilters(XFilter)
app.useGlobalFilters(XFilter())

//🚗Pipe (Validation/Transform)
class Pipe implements PipeTransform
=> transform(Val,ArgumentMetadata):Val
=> throw new BadRequestException
✅ValidationPipe=>class-transformer/validator
class Dto{@IsString() name:string}
=> @Body()dto:Dto]
@Param('id',ParseIntPipe,CusPipe)
@Query('page',new DefaultValuePipe(1))
@usePipes(ValidationPipe)
app.useGlobalPipes(new ValidationPipe());

//🚗Guard (Jwt/Role/Resource)
class Guard implements CanActivate
=> canActivate(ExecutionContext):boolean|Observable
=> ctx.switchToHttp.getRequest => validateToken(req)
@useGuards(AuthGd)
@useGlobalGuards(new AuthGd)

//🚗Interceptor (Monitor/Log/Cache/FormatRes/Error)
class Interc implements NestInterceptor
=> intercept(ExecutionContext,CallHandler)
=> next.handle()
@useInterceptors(Interc)
@useGlobalInterceptors(Interc)
```

```ts
//🚗Decorator (Param/Metadata/Combine)
createParamDecorator((data,ExecutionContext)=>)
applyDecorators(SetMeta(),UseGuards())
@CustDec(ValidationPipe(validateCustormDecorators))
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

#### Variant

```ts
//🚗Upload
MulterModule.registAsync({
  storage:diskStorage({
    destination,filename(req,file,cb)
  }),
  useFactory:()=>{
	{dest,name}
  }
})
@useInterceptors(
  FilesInterceptor
  |FileFieldsInterceptor
  |AnyFilesInterceptor	
)
@uploadedFile(
  ParseFilePipe({
    validators:[
      MaxFileSizeValidator({maxSize}),
      FileTypeValidator({fileType})
    ]
  })
) file:Express.Multer.File
```

## 🚀Model

#### SECURE

#### ORM

```ts
//🚗MYSQL
```

```ts
//🚗MONGO
```

```ts
//🚗REDIS
```

## 📚Conf

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

## 📚Appendix

#### Standalone

```ts
const app = NestFactory.createApplicationContext(appModule)
const tasksService = app.select(TasksModule).get(TasksService, { strict: true });
export const dynamicConfigModule = ConfigModule.register({ folder: './config' });
```

