### 安装配置

```shell
# 安装
npm i -g typescript
npm i -g ts-node # 运行
npm i -s @types/node 
# 编译
tsc .ts
# 任务→监视tsconfig.json
tsc --init
```

### 数据类型

~~~js
// 基本类型（多类型|&）
- any, unknown
- void, never
// 对象类型
- object|{xx?|[xx:string]:any}
// 数组类型
- string[],Array<string>
- [string,string]
// 枚举类型
- enum xx{k=v,...}
// 函数类型
- (xx:number)=>number
// 类型别名
- type xx = xx
// 类型断言
- xx as string
- <string>xx
// 命名空间
- export namespace _name{ export }
- _name._xx
~~~

### 类

~~~typescript
// 继承类
class A extends B{
  static xx // 静态
  readonly xx //只读
  public xx //公有
  protected xx //子类公有
  private xx //私有
  constructor(xx:string){
    super(xx)
    ....
  }
  set xx(){}
  get xx(){}
  method()...
}
// 抽象类
abstract class A{
  abstract method():void; 
}
// 接口
interface xx{ xx:type;xx void(); }
class xx implements xx
// 泛型
function|class xx<xxType extends xxclass>
~~~

#### 编译

~~~json
// 编译选项：tsconfig.json
- include|exclude
- compilerOptions
	outDir:./dist
    outFile:app.js

	target:es2015
	module:commonjs
    lib:dom

	noEmit:true
    noEmitOnError:true
    
	allowJs:true
    checkJs:true
	removeComments:true

	strict:true
	strictNullChecks:true
    alwaysStrict:true
    noImplicitAny:true
    noImplicitThis:true	
// 打包：webpack.config.js
- output
	environment:{arrowFunction:false}
- use
	loader:'babel-loader'
	options:{
		presets:[
          	['@babel/preset-env',{targets:{'chrome':'88','ie':'11'},'corejs':'3','useBuiltIns':'usage'}]
        ]
    }
~~~

#### 声明文件

> lib=> .d.ts

**declare**