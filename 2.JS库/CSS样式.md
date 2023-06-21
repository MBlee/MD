### CSS常用图形

~~~css
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
~~~

### CSS样式

~~~js
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
// 特效字体
- fontmin
@font-face{
  font-family,
  src:url()format('truetype'),...
}
// 文字
- font，size|family, style|weight|variant
- text-decoration, blink
- text-transform
- letter-spacing, word-spacing
- text-indent
- word-wrap，word-break
// 文本省略
- overflow|text-overflow|white-space
- overflow|text-overflow|word-break
  -webkit-box|-webkit-box-orient|-webkit-line-clamp
// 滚动条自定义
// 滚动条隐藏
- .out	{overflow:hidden}	.inner{right:-17px}
- .ele::-webkit-scrollbar	{width:0 !import}
- .ele	{-ms-overflow-style:none}
- .ele	{overflow:-moz-scrollbars-none}
~~~

### CSS特效

~~~js
// 滤镜
- filter
opacity||blur(50%)
// 渐变
~~~

### CSS选择器

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

### CSS面试

~~~shell
# 三角形原理
四个角边框，延对角线均分，斜边配合宽高
~~~

~~~shell
# 行内元素的padding、margin是否无效？
行内元素的padding-top、padding-bottom从显示的效果上是增加的，但其实设置的是无效的。并不会对他周围的元素产生任何影响。
~~~

~~~shell
# 清除浮动
1. overflow
2. clearfix:after
   content, display, clear
   visibility
3. 内墙||外墙||伪元素
~~~

~~~shell
# BFC
- 块级格式化上下文，独立的渲染区域，内部元素渲染不影响外界
形成：
- 浮动元素（！none）
- 绝对定位元素（absolute|fixed）
- 块级元素overflow（！visible）
- flex|inline-block|table-cell
应用：
- 清除浮动|禁止浮动重叠
~~~

~~~shell
# 外边距塌陷
形成：
- 上下margin取最大
- 父子margin取最大（父无上内及边框）
- 空margin合并
解决：
1. 只设置一个margin
2. 设置内边|BFC
~~~

