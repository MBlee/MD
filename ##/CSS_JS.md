## CSS

#### 权重优先级

- 标签：1（伪元素）
- class：10（伪类|属性）
- Id：100
- 行内：1000

> 相同权重>后者优先，!important优先级最高，*>+继承最低为0

#### 新增选择器

- :first-of-type|:nth-of-type|:not
- :enabled|:disabled|:checked
- ::before|::after|::selection|::placeholder

#### 伪类|伪元素

> 伪类：同一元素的不同状态|描述
>
> 伪元素：不存在DOM（无法js操作），创建新虚拟元素

#### 渲染机制

- 浏览器采用流式布局
- 将HTML解析成DOM，CSS解析成CSSOM，[CSSOM和DOM结合生成Render tree]()
- 根据节点样式计算节点位置，把[节点绘制]()到页面上

#### 回流重绘

**回流：**当render tree中的一些元素的[结构或者尺寸]()等发生改变，浏览器[重新渲染]()部分或者全部文档的过程叫做回流。

- 首页渲染|窗口变化
- 内容变换|节点增删|激活CSS伪类|clientWidth

**重绘：**当页面中元素样式的改变[不影响]()它在文档流中的[位置]()，浏览器会将[新样式赋予给元素]()，这个过程叫重绘。

- background
- visibility

**避免性能影响：**

CSS：避免[table]()布局|多层[内联]()样式

Javascript：

- 避免频繁操作[DOM]()
- 对于大量插入DOM的操作，建议使用文档片段，也就是[documentFragment]()

> 回流必重绘，重绘不一定回流。回流的性能消耗比重绘大。

#### BFC

> 块级格式化上下文，独立容器，内部渲染不影响外界

**创建：**

- display：inline-block|flex|grid
- position：非static
- float：非none
- overflow：非auto

**作用：**清除浮动|禁止浮动重叠

#### 外边距塌陷

**形成：**

- 上下margin取最大
- 父子margin取最大（服务上内及边框）
- 空margin合并

**解决：**

- 只设置一个margin
- BFC|设置内边距

#### 三栏布局

> .left + .right + .center

> 左：**float:left**
>
> 右：**float:right**
>
> 中：**padding|margin**

#### 圣杯布局

> .center + .left + .right

> **float:left**

> 父：**padding**
>
> 左右：**margin**:-100%，**left**

#### 双飞翼布局

> (.center > div) + .left + .right

> **float:left**

> 中：**padding**
>
> 左右：**margin**:-100%

## ES6

#### Let、Const

- 不能重复声明
- 先声明后使用
- 块级作用域|不变量提升|不添加Window

> Const必须声明时赋值，不可重复赋值

#### 模板字符串

[${变量|表达式|函数}]()

> 转义\，隐式转换

#### 属性方法简写

> key相同

#### 剩余参数

fn(a,b,[...args]())

> 必须最后一个，arguments是伪数组（所有实参），...args（无对应形参的实参）

#### 扩展运算符|解构赋值

[取出并拷贝]()可遍历[属性]()

> 合并|拷贝对象数组，函数（数组参数）

[数组对象解构]()：{a,b} = obj，[a,b] = arr

## JS

#### 传值和传址

#### 数据类型

## 网络通信

#### 通信流程

1. 查询[IP]()（浏览器IP|浏览器缓存|DNS域名解析）
2. [TCP]()连接
3. [HTTP]()请求响应

#### TCP

#### HTTP

**请求头**

```markdown
- GET / HTTP/1.1
```

```markdown
- Host:	www.xxx.com
- Connection:	keep-alive
- Cache-Control:	max-age=0
- User-Agent:	
```

**响应头**

```markdown
- HTTP/1.1 200 OK
```

**数据头**

```markdown
- Content-Type
- Expires
- Last-Modified
```

```markdown
- Content-Encoding
- Content-Language
- Content-Length
- Content-Location
```

#### POST和GET

- [数据]()
- [缓存]()（GET可缓存，POST不缓存）
- [安全性]()

#### RESTful

#### HTTP状态码

- 100-199（已接受正在处理|[websocket]()）

- 200-299（成功）

- 300-399（重定向）

  > 301		Moved Permanently
  >
  > 302		Move Temporarily

- 400-499（客户端错误）

- 500-599（服务端错误）