# CSS布局

### 流布局

~~~shell
# 行元素
- text-align
- line-height|vertical-align
~~~

~~~shell
# 块元素
- margin：auto
- position=>left=>margin|translate(-50%)
~~~

~~~shell
# 浮动布局
- clear => display => hidden(height)
~~~

### Flex

- display（flex|inline-flex|-webkit-flex)
~~~shell
# 整体
- flex-flow（flex-direction，flex-wrap）
- justify|align-content
- align-items
# 单个
- flex（flex-grow，flex-shrink，flex-basis）
- align-self
- order
~~~

### Grid

- display (grid|inline-grid)
- 容器
~~~js
// 宽高|区域 
- grid-template-colums|rows
(auto|fr|repeat(n|auto-fit-fill,100px)|minmax(min-content|max-content))
([c|r])
- grid-template-areas
(x|.)(x-start|end)
- grid-template
- grid
// 超出位置
- grid-auto-columns
// 方向
- grid-auto-flow
(row|row dense)

// 间距
- grid-gap|grid-column-gap(gap|column-gap)

// 对齐
- justify|align|place-items
- justify|align|place-content

~~~

- 元素

~~~js
// 位置
- grid-column-start|end
(num,area,span 2)
- grid-column(/)
- grid-area
(area,row-start/end)
- algin|justify-self
~~~



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

~~~shell
# 多动画tranform 顺序计算，同时执行
~~~

### 动画

~~~css
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
~~~

# CSS样式

**z-index**

- 必须定位元素
- 可以为负值
- 不同父子，根据父z-index显示

# CSS案例

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

### 常见布局

~~~shell
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
~~~

