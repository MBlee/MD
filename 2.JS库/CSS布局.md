# CSS布局

### 行内元素

- text-align，line-height|vertical-align

### 块元素

- margin：auto
- position=>left=>margin|translate(-50%)

### Flex

- display（flex|inline-flex|-webkit-flex)
1. flex-flow（flex-direction，flex-wrap）
   
   justify|align-content
   
   align-items

2. flex（flex-grow，flex-shrink，flex-basis）
   
   order
   
   align-self

### Grid

- display (grid|inline-grid)
1. grid-template-colums|rows  (fr|auto|repeat(n,100px))
   
   grid-colum-gap
   
   grid-template-areas
   
   justify|align|place-items
   
   justify|align|place-content

2. grid-row|column-start|end
   
   grid-area
   
   algin|justify-self

### 响应式布局

**媒体查询**

- @media screen and

- <style/link media>

**Rem|百分比**

- clientwidth
- fontsize=(cw*(10/320)>40)

flexible|cssrem|postcss-px2rem

# CSS动画

### 过渡

CSS属性的变化（简单流畅-减少代码量），:hover, :active, :focus

**transition**

- property | duration | timing-function | delay

**transform**

- translate|scale(x, y)
- rotate(45deg)
- skew(-45deg,y)
- perspective(n)

### 动画

# CSS样式

**背景**

- 块背景，repeat, position
- 行背景，padding...fontsize...absolute
- background: color|image, position|repeat|attachment

**字体**

- font，size|family, style|weight|variant
- text-decoration, blink
- letter-spacing, word-spacing
- text-indent

**精灵图**

- 水平|垂直精灵图，宽|高固定
- 点精灵图，父宽高固定

**箭头**

border界限是对角线，border切分成4个三角形，保留该方向的border

**超链接样式**

.link, visited, hover, active

**伪类|伪元素**

before, content

**z-index**

- 必须定位元素
- 可以为负值
- 不同父子，根据父z-index显示

# CSS案例

### 布局基础

**清除浮动**

1. :after
   
   content, display, clear
   
   visibility

2. overflow

**BFC**

块级格式化上下文，独立的渲染区域，内部元素渲染不影响外界

形成：

- 浮动元素（！none）
- 绝对定位元素（absolute|fixed）
- 块级元素overflow（！visible）
- flex元素
- inline-block元素

应用：

- 清除浮动

**外边距塌陷**

形成：

- 上下margin取最大
- 父子margin取最大（父无上内及边框）
- 空margin合并

解决：

1. 只设置一个margin
2. 设置内边|BFC

### 技巧

**Emmet插件**

### 常见布局

**双飞翼布局**

center:100%, left: margin(-100%), right: margin(-自身)

**圣杯布局**

父padding, 子relative

**列表布局**

宽度，间距，个数 =>  单宽

### 常见动画

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
