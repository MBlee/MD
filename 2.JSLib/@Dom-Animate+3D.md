## Canvas

#### Canvas基本

~~~js
- canvas.getContext("2d")
- canvas.toDataURL("image/png")
- canvas.globalAlpha
- canvas.globalCompositeOperation
// 清除画布
- ctx.clearRect(x,y,w,h)
- ctx.translate()

// 核心方法
- ctx.beginPath()|closePath()
- ctx.stroke()
- ctx.fill()
- ctx.rect()
- ctx.save()
- ctx.restore()
// 核心属性
- ctx.fillStyle|strokeStyle
- ctx.lineWidth
- ctx.lineCap
- ctx.lineJoin

// 画线
- ctx.moveTo|lineTo(x,y)
// 画圆
- ctx.arc(x,y,r,start,end,clockwise)
// 画矩形
- ctx.fillRect|strokeRect(x,y,w,h)
// 画文字
- ctx.fillText|strokeText('text',x,y,mw)
- ctx.measureText('text')
- ctx.font
- ctx.textAlign|textBaseline
// 像素坐标
- ctx.getImageData(0,0,w,h)
- ctx.drawImage
// 查找不透明像素
x,y => index = x + y*width
=> data[index*4 + 0|1|2|3]
if (data[3]>128) => draw...
~~~

```shell
#! 图片
# 图片裁剪
drawImage(IMG,cx..,rx)
# 背景图
createPattern(IMG|CANVAS,'repeat')
# 路径裁剪
clip()
# 像素处理
getImageData(x,y,w,h)
createImageData(CANVAS|w,h)
putImageData(ImageData,x,y,sx,sy,sw,sh)
```

```shell
#! 渐变|阴影
# 线性渐变
ctx.createLinearGradient(x1,y1,x2,y2)
ctx.addColorStop(0~1,color)
# 径向渐变
ctx.createRadialGradient(x1,y1,r1,x2,y2,r2)
ctx.addColorStop(0~1,color)
# 阴影
ctx.shadowOffsetX|Y
ctx.shadowBlur
ctx.shadowColor
```

```shell
#! 变形
ctx.translate()
ctx.rotate()
ctx.scale()
# 矩阵
ctx.transform(scaleX,rotateX,rotateY,scaleY,translateX,translateY)
ctx.setTransform()
```

#### 碰撞检测

```shell
# 外界矩形检测
!(x1+w1 < x2||...)
# 外接圆检测
distance < r1+r2
```

```shell
# 多物体碰撞
排列与组合：n*(n-1)/2
for(i)=>for(j=i+1)
```

#### 用户交互

```shell
#! 捕获物体
# 矩形捕获
mouse.x>x && mouse.x<x+w...
# 圆形捕获
distance < ball.r
```

```shell
#! 拖拽物体
mousedown => mouse.x || offset.x
mousemove => mouse.x - offset.x
mouseup => removeEvent
#! 抛掷物体
```

```shell
#! 键盘
keydown|up|code
```

#### 匀变速动画

```shell
# 匀变速
v = v +- x
# 摩檫力
v = v * friction
```

#### 缓动动画

```shell
v = (end-current)*easing
```

#### 弹性动画

```shell
v += (end-current)*spring
v *= friction
```

#### ......

#### 数学公式

```shell
Math.sqrt(x*x+y*y)
Math.sin()
Math.cos()
Math.atan2()
```

#### 案例

~~~js
// 随机统计图
// 茶杯
// 圆形统计图
// 碰撞检测
clearRect()
ctx.arc(x,y,r,start,end,clockwise)(random)
// 面向对象的小球
~~~

#### Ext

```shell
# 二次贝塞尔曲线
# 三次贝塞尔曲线
# 物理动画
# 重力|摩檫力
# 排列组合
# 抛掷物体
# 弹性动画
```

## Webgl

>  颜色转换

```js
// 第三方库
new Color("rgba(255,0,0,1)")=>
color.r|g|b
// 封装
/\((.*)\)/.exec(rgbStr)[1].split(',')
parseInt(n)/255
```



```js
// 获取画布上下文
canvas.getContext("webgl")
// 底色
gl.clearColor(1,1,1,1)
gl.clear(gl.COLOR_BUFFER_BIT)
// 
```

#### 案例

```js
// 底色闪变
!(function ani(){
  color.offsetHSL(0.005,0,0)
  gl.clearColor(color.r,color.g,color,b)
  gl.clear(gl.COLOR_BUFFER_BIT)
  requestAnimationFrame(ani)
})()
```



## Three

#### 术语

WebGL容器（坐标系）

x|y|z：-1~1

WebGL渲染管线
