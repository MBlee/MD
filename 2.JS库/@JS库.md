## 基本对象

#### 字符串

```shell
# 查位置
- indexOf, string=> -1|firstIndex
- lastIndexOf, string=> -1|lastIndex
- charAt, index=> char
- search, reg=> -1|index
- match, reg/g=> null|[]
# 修改
- replace, regA|stringB
- toLowerCase|toUpperCase
- substring|slice, begin|end
- substr, begin|length
# 转换
- split(), string=> [,]
- parseInt|parseFloat, (string,redix)=>NaN|10
```

#### 数学

```js
// 转为数值（全局）
- Number|parseInt|parseFloat
- String()|toString|toFixed
// 取整|绝对值
- Math.ceil|float|round
- Math.abs
// 随机数
- Math.random(), 0-1.0
- Math.round(Math.random()), 随机0或1
// 最大最小值
- Math.max()|min()
// 幂次方
- Math.pow(x,y)
// 弧度||角度
- Math.PI / 180
```

```js
// 非法数字
- NaN //唯一自身不全等
- isNaN()
1. typeof value === 'number' && isNaN()
2. value !== value
// 特殊数字
- MAX_VALUE|MIN_VALUE|NEGATIVE_INFINITY|POSITIVE_INFINITY
```

#### 空对象

- undefined
  - typeof(obj) == "undefined"
  - obj === undefined
- !obj, null

## 引用对象

#### 数组

```js
// 转字符串
- join()|toString()
// 转数组
- Array.from(类数组|对象,v=>v)
- Array()|Array().of()
- flat|flatMap
```

```js
// 查索引
arr.findIndex(item => item===xxx)
// 查值
arr.find(item => item>10)
// 查询是否包含
arr.includes(item,fromIndex)
arr.indexOf(item)
// 查指定值
arr.filter
arr.entries|values|keys
```

```js
// 多数组合并
- concat
- push(...arr)|[...arr1, ...arr2]
- Array.prototype.push.apply
// 堆栈操作
- pop|push|shift|unShift
- splice|slice|fill|delete
- [index|length]
```

```js
// 数组乱序
arr.sort(()=>(Math.random()-0.5))
// 数据去重
- [...new Set(arr)cha]
```

#### 对象

```js
// 查自身属性
hasOwnProperty()
// 查键值对
Object.keys()
Object.values()
Object.entries()
```

```js
// 合并对象
Object.assign(target,...)=>target
```

## 正则表达式

### 正则

```shell
# 创建(字面量，变量，对象)
- /xxxStr/
- `/${xxxVar}/`
- new RegExp("xxx",...)
```

- 数字：**\d \D**

  字母数字下划线：**\w \W .**

  字符属性：**\p{L|N|P|sc=Han}**

  空白：**\s \S**

  转义：**\ . \/**

  原子表：**[^] , [-] , |**

- 原子组：**(?:) , \0\1\2 , $1|&`'**

  断言：**(?=) (?<=) (?!) (?<!)** 

- 0或多个：**? + * {1,3}**

```shell
# 修饰符
- 全局：g
- 高效：y
- 多行：m|s
- 忽略大小写：i
- 字符编码：u
```

### 方法

```shell
# 正则方法
- reg.test(xxStr)
- reg.exec(xxStr)
# 属性
- reg.lastIndex
```

```shell
# 字符串查找
- match()，reg=> null|[,]
- search()，reg=> -1|index
# 替换
- replace()，reg, str|fn
```

### 案例

```shell
# 邮箱验证
reg = /^[\w-]+@([\w-]+\.)+(com|cn|cc|org|net)$/i
# 手机号验证
# 用户名验证
# 密码验证
```

```shell
# 模糊手机号
# 限制关键词
```

## 循环

```js
// for循环
for(let i,xx; xx=xxs[i++];)
for(const i in arr|obj)
for(const i of arr)
- arr.forEach((item,index,arr)=>{})
- arr.map((item,index,arr)=>{})

// while循环
- while(false){}
- do{}while(false)
```

```shell
# 内部核心
- label:for() => break|continue
```

```shell
# for in
- 遍历prototype|obj
- 可以break
# for of
- 遍历arr|类数组|map|set|str
- 可以break
# forEach和map
1.forEach|map锁定数组。map返回新数组
2.无法break
```

## 判断

```js
// switch
switch(n){case n: ... break;}
// 短路表达式
a && a=[](true)
a || a=[](false)
```

```js
// 类型判断
- toString
- typeof
- instanceOf|isPrototypeOf|constructor
// 属性判断
- obj.hasOwnProperty('') //自身属性
- key in obj //继承属性
- obj.key||(obj.key !==undefined) //不识别undefined
```

## 设计模式

#### 发布订阅者

```shell
# 发布者和订阅者解耦
# 触发事件 => 调度中心(全局) => 响应事件
```

**Class版本**

```js
// 事件容器 => 事件数组
handlers = {}
```

```js
// 添加事件
addEventListener (type, handler) {
  // 判断handlers有没有type事件
  if (!(type in this.handlers)) {
    this.handlers[type] = []
  }
  // 添加方法
  this.handlers[type].push(handler)
}
```

```js
// 触发事件
dispatchEvent (type, ...params) {
  // 无效事件抛出
  if (!(type in this.handlers)) {
    return new Error('未注册该事件')
  }
  // 便利触发
  this.handlers[type].forEach(handler => {
    handler(...params)
  })
}
```

```js
// 移除事件
removeEventListener (type, handler) {
    // 无效事件抛出
    if (!(type in this.handlers)) {
      return new Error('无效事件')
    }
    if (!handler) {
      // 移除事件
      delete this.handlers[type]
    } else {
      const idx = this.handlers[type].findIndex(ele => ele === handler)
      // 抛出异常事件
      if (idx === undefined) {
        return new Error('无该绑定事件')
      }
      // 移除事件
      this.handlers[type].splice(idx, 1)
      if (this.handlers[type].length === 0) {
        delete this.handlers[type]
      }
    }
}
```

## JS定位

**offset**

offsetTop, offsetHeight(padding+content+border), offsetParent

**client**

clientWidth(padding+content)

**scroll**

- scrollTop, scrollHeight(padding+content)
- onscroll

(window.pageXOffset|documentElement|body)

- scrollTo()|scroll(), scrollBy()

**Mouse**

offsetY, pageY, clientY, screenY

## JS动画

**匀速运动**

timer, offsetTop > style

**轮播图**

## JS异步

#### Promise

```js
// 封装异步1
Promise((resolve,reject)={resolve()})
.then{return ""|Promise.resolve("")}
.catch|finally
// 封装异步2
Promise.resolve|reject
// 多个异步
Promise.all|race
```

#### Async|Await

```js
- async fn
- for await（ of ）|for
```

#### 原理

```js
// 同步回调 => 立即执行
- foreach遍历
// 异步回调 => 加入队列
- setTimeout|Promise
// 错误处理
- TypeError|ReferenceError
- message|stack
- try{}catch(err){}
- throw new Error
// Promise
- pending => resolve|reject() => onResolved|reject()

```

#### 兼容

Babel转译器

## TS

#### 安装配置

```shell
# 安装
npm i -g typescript
# 编译
tsc .ts
# 任务→监视tsconfig.json
tsc --init
```

#### 数据类型

```js
// 基本类型
1. any, unknown
2. void, never
3. object{xx?[xx:string]:any}
4. (xx:number)=>number
5. string[],Array<string>
[string,string]
6. enum xx{}
7. type xx
// 类型断言
- xx as string
- <string>xx
```

#### 类

```typescript
// 继承类
class A extends B{
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
```

#### 编译

```json
// 编译选项：tsconfig.json
- include|exclude
- compilerOptions
	target:es2015
	module:commonjs
    lib:dom
    outDir:./dist
    outFile:app.js
    allowJs:true
    checkJs:true	removeComments:true
    noEmit:true
    noEmitOnError:true
    alwaysStrict:true
    noImplicitAny:true
    noImplicitThis:true	strictNullChecks:trueo
    strict:true
```

## CSS布局

#### 流布局

```shell
# 行元素
- text-align
- line-height|vertical-align
```

```shell
# 块元素
- margin：auto
- position=>left=>margin|translate(-50%)
```

```shell
# 浮动布局
- clear => display => hidden(height)
```

#### Flex

- display（flex|inline-flex|-webkit-flex)

```shell
# 整体
- flex-flow（flex-direction，flex-wrap）
- justify|align-content
- align-items
# 单个
- flex（flex-grow，flex-shrink，flex-basis）
- align-self
- order
```

#### Grid

- display (grid|inline-grid)

```shell
# 整体
- grid-template-colums|rows  (fr|auto|repeat(n,100px))
- grid-colum-gap
- grid-template-areas
- justify|align|place-items
- justify|align|place-content
# 单个
- grid-row|column-start|end
- grid-area
- algin|justify-self
```

#### CSS动画

**过渡**

CSS属性的变化（简单流畅-减少代码量），:hover, :active, :focus

**transition**

- property | duration | timing-function | delay

**transform**

- translate|scale(x, y)
- rotate(45deg)
- skew(-45deg,y)
- perspective(n)

```shell
# 多动画tranform 顺序计算，同时执行
```

**动画**

```css
/* animation */
- animation-name|duration|timing-function|delay
+ animation-iteration-count
+ animation-direction
+ animation-play-state
/* @keyframes */
@keyframes  x_name{
  from => to
  0% => 100%
}
```

#### CSS样式

**z-index**

- 必须定位元素
- 可以为负值
- 不同父子，根据父z-index显示

#### 常见动画

```css
/* 旋转动画 */
.App-logo {
    animation: App-logo-spin infinite 20s linear;
  }
@keyframes App-logo-spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
```

#### 常见布局

```shell
# 三栏布局
left：fleft，right：fright，center：padding|margin
# 双飞翼布局
center:100%, left|right: margin(-100%)
# 圣杯布局
父padding，center：100%，left|right：margin+relative
# 列表布局
宽度，间距，个数 =>  单宽
# 常见布局
# 京东轮播图
# 网易导航布局
新闻 | 体育 | NBA
# 新浪布局|新浪TAB栏
# 优酷
# 时间轴布局
```

## CSS样式

#### CSS常用图形

```css
/* 三角形 *//*（正：上即下|左即右）（斜：上下-左右）（梯形：设宽）*/
.triangle{
  width:0;
  height:0;
  border-top: 10px solid red;
  border-left:10px solid transparent;
}
/* 心型 */
/* 钻型 */
/* 五角星 */
/* 圆缺*/
```

#### CSS样式

```js
// 背景图||精灵图
- 块背景，repeat, position
- 行背景，padding...fontsize...absolute
- background: color|image|repeat，attachment|position
- background-size: cover|contain|%
// 字体图标
- iconfont => 1.unicode 2.fontclass 3.svg
- unicode => 
	1.html:&#x16;
    2.js:\u{16}
	3.css:\16
// 文字
- font，size|family, style|weight|variant
- text-decoration, blink
- letter-spacing, word-spacing
- text-indent
```

#### CSS特效

```js
// 滤镜
- filter
opacity||blur(50%)
// 渐变
```

#### CSS选择器

```shell
# 核心选择器
- 标签|属性[attr='value']|Class|ID
- 后代|子>+~|:first-of-type|last|nth
# 伪类选择器
- :link|visited|hover|active
- :not
# 伪元素
- :before:after
```

```shell
# 可用|选中状态
- :enabled
- :disabled
- :checked
# 根节点
- :root
# 选中节点
- ::selection
```

#### CSS面试

```shell
# 行内元素的padding、margin是否无效？
行内元素的padding-top、padding-bottom从显示的效果上是增加的，但其实设置的是无效的。并不会对他周围的元素产生任何影响。
```

```shell
# 清除浮动
1. overflow
2. clearfix:after
   content, display, clear
   visibility
3. 内墙||外墙||伪元素
```

```shell
# BFC
- 块级格式化上下文，独立的渲染区域，内部元素渲染不影响外界
形成：
- 浮动元素（！none）
- 绝对定位元素（absolute|fixed）
- 块级元素overflow（！visible）
- flex|inline-block|table-cell
应用：
- 清除浮动|禁止浮动重叠
```

```shell
# 外边距塌陷
形成：
- 上下margin取最大
- 父子margin取最大（父无上内及边框）
- 空margin合并
解决：
1. 只设置一个margin
2. 设置内边|BFC
```

## HTML5

#### 音视频

```js
// video标签
- src,poster,width
- controls，muted,autoplay,loop
- preload
// audio标签
- src
- controls，muted,autoplay,loop
- preload
// source标签
- src
- type
```

```js
// video属性方法
- playbackRate
- volume
- duration
- currentTime
- paused
- videoWidth
+ play()
+ pause()
+ load()
// video事件
- onloadedmetadata
- onloadstart
- onloadeddata
+ oncanplay
+ onplay
+ onpause
+ ontimeupdate
+ onend
- onvolumechange
- onseeked
- onratechange
```

#### 直播

```js
// 获取流
navigator.mediaDevices.getUserMedia({video:true}).then(mediaStream=>{})
// 设置流
video.scrObject = mediaStream
// 播放流
video.onloadedmetadata = ()=>{
  video.play()
}
```

## 支付

**支付流程：**

```shell
# 页面逻辑
1. 立即购买 → 确认订单
2. 提交订单（支付方式） → 付款
# 核心
# 1. 立即购买 => Ajax请求（用户|订单金额|订单商品） => 返回订单号（跳转订单页）
# 2. 支付方式 => Ajax请求（订单号|appid|支付方式）=> 返回true|支付方式标识|支付方式对比
# 传参（app_id,channel,title,total_free,bill_no,bill_timeout）
# 3. 对接官方支付 => 数据传递给官方 => 返回结果
```

- 创建订单参数


- 提交订单参数

```shell
# 提交参数
- app_id
- channel
- title|total_fee
- bill_no|bill_timeout
# 返回参数
- data.result_code
```

- 付款参数

```shell
- channel
# 支付宝
- paySrc(data.order_string)
# 微信
- paySrc({
  appid,
  noncestr,
  package,
  partnerid,
  prepayid,
  timestamp,
  sign
})
```

1. **前端支付**
2. **小程序支付**

## 上传下载

**下载：**

```js
// Blob下载：1.读取url为blob	2.blob转url	3.a.click()
function download(url){
  const xhr = new XMLHttpRequest()
  xhr.open('GET',url)
  xhr.responseType = 'blob'
  xhr.send()
  xhr.onload = function(){
    const fileBlob = xhr.response
    const fileUrl = URL.createObjectURL(fileBlob)
    const eleA = document.createElement('a')
    eleA.click()
  }
}
```

**上传：**

```js
// Blob二进制数据
new Blob([str],{type:'text/plain'})
blob.text().then(res=>{})
```

```js
// 文件读取
// FileReader
fileReader.readAsDataURL|text()
fileReader.onload = (e)=>{e.target.result}
// URL
URL.createObjectURL(blob)
```

## 地图

**定位**

```shell
# navigator.geolocation
- getCurrentPosition(e =>{e.coords.longtitude|latitude})
```

**百度地图**

```js
// 百度地图API
1.申请百度开发者 > 2.获取密钥ak >3.使用相关功能
// 基本使用
- new BMap.Map('container|id')
- new BMap.Point(116.404,39.915)
- map.centerAndZoom(point,3|3-19)
- map.panTo(new BMap.Point(116.404,39.915))
- map.enableScrollWheelZoom(true) //滚轮缩放

// 地图控件
- map.addControl(new BMap.NavigationControl())//平移缩放
- map.addControl(new BMap.OverviewMapControl())//缩略地图
- map.addControl(new BMap.ScaleControl())//比例尺
- map.addControl(new BMap.MapTypeControl())//地图类型

// 标注
new BMap.Icon('x.png',new BMapSize(25,35))
new BMap.Marker(point,{icon:myIcon})
map.addOverlay(marker)
new BMap.InfoWindow('message',{width:200,height:150,title:"title"})
marker.onclick =()=>{
  map.openInfoWindow(infoWindow,point|map.getCenter)
}
```

## 动画

#### Canvas基本

```js
// 获取画布上下文
- canvas.getContext("2d")
// 开始
- ctx.beginPath|closePath
- ctx.clearRect(x,y,w,h)
// 画线
- ctx.moveTo|lineTo(x,y)
- ctx.strokeStyle|lineWidth
- ctx.stroke
// 画矩形
- ctx.fillRect|strokeRect(x,y,w,h)
- ctx.fillStyle()
- ctx.fill()
// 画圆
- ctx.arc(x,y,r,start,end,clockwise)
```

#### 案例

```js
// 随机统计图
// 茶杯
// 圆形统计图
// 碰撞检测
clearRect()
ctx.arc(x,y,r,start,end,clockwise)(random)
// 面向对象的小球
```

## CSS适配

**Postcss-px-to-viewport转化插件**

```js
// postcss.config.js配置
plugins > "Postcss-px-to-viewport"
// 基本
- viewportWidth:375|667
- viewportUnit:'vw'
- unitPrecision:5
- minPixelValue:1
// 忽略配置
- exclude:[/tabbar/]
- selectorBlackList:['ignore']
- mediaQuery:false
/* px-to-viewport-ignore-next */
/* px-to-viewport-ignore */
```

## 响应式布局

**媒体查询**

- @media screen and
- <style/link media>

**Rem|百分比**

- clientwidth
- fontsize=(cw*(10/320)>40)

flexible|cssrem|postcss-px2rem

**flexible**

```js
// 设置body字体大小
function setBodyFont{
  if(document.body){
    document.body.style.fontSize = (12*dpr)+'px'
  }else{
    document.addEventListener('DOMContentLoaded',setBodyFont)
  }
}
// 设置Rem(html)大小
function setRemUnit(){
  var rem = docEl.clientWidth / 10
  docEl.style.fontSize = rem+'px'
}
```

