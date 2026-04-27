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
@Injectable() 
=> constructor(private prov)
=> constructor(@Optional @Inject(<Val>) private prov)
=> @Inject(<Val>) private readonly prov
           
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
```

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

//🚗Pipe
class pipe implements PipeTransform
=> transform(Val,ArgumentMetadata):Val
=> throw new BadRequestException
✅ValidationPipe=>class-transformer/validator
class Dto{@IsString() name:string}
=> @Body()dto:Dto]
@Param('id',ParseIntPipe,CusPipe)
@Query('page',new DefaultValuePipe(1))
@usePipes(ValidationPipe)
app.useGlobalPipes(new ValidationPipe());

//🚗Guard
class guard implements CanActivate
=> canActivate(ExecutionContext):boolean|Observable
=> ctx.switchToHttp.getRequest => validateToken(req)
✅@useGuards(AuthGd)
@useGlobalGuards(new AuthGd)

//🚗Interceptor

```

```ts
//🚗Decorator
```

```ts
// NestAPP
- NestFactory.create<NestExpressApplication>(appModule)
- abortOnError
- -- -b swc
```

```ts
// Pipes (@injectable)(PipeTransform)
// Built-in pipes
- ParseIntPipe(Float/Bool/UUID/Array/Enum/File/Date)
- ValidationPipe
// Custom pipes
- transform(val,meta)
- meta:{type,data}
// Binding pipes
- @Param('id',Pipe) // (Query/Body/Custom) 
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

