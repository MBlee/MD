#### 组件

```ts
@Entry
@Component
struct Index{
    @State
	build(){
        Row()=>Column()=>Text()
    }
}
```

```ts
List()=> ListItem()
Row()|Column().height('100%')
Text(msg).fontWeight(FontWeight.Bold)
Button(msg).onClick(()=>{this})
```

```ts
// 循环 
ForEach(this.arr,(item,index)=>{},item=>item)
// 判断
if(){}
```



#### 路由

```ts

```

#### 基本语法

```ts
// 基本类型
let n:number = n|0b..|0x..|0o
let s:string = s
let b:boolean = b
let u:string|number|boolean
// 数组类型
let a:Array<string> = [...]
let b:string[] = [...]
// 枚举类型
enum e{...,}
// any,unknown,void,undefined,null
let a:any
let a:unknown
fn:void
```

