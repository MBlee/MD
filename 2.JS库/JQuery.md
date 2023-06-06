### DOM树

### DOM元素

~~~js
// 选择器
- children|parent|find
- eq(index)
- siblings|next|prev
// 动态数据
- text('xxx')
// 动态样式
- css('xxx',''|{})
- addClass|removeClass|hasClass|toggleClass
- show|hide|toggle
// 动态事件
- click(fn)
- mouseover||enter|leave
// 动画
- show|hide|toggle(duration,callback)
- slideDown|slideUp|slideToggle(duration,callback)
- fadeIn|fadeOut|fadeToggle|fadeTo(duration,to,callback)
- animate(props,duration,swing|linear,callback)
~~~

### 常用API

~~~js
// 入口函数
$(document).ready(fn)
~~~

样式：**css()**

事件：**click()**

### 特点

~~~js
// 优点
1. 代码简洁（链式编程|隐式迭代）
2. 兼容|容错率
// $（函数）
- 匿名函数 => 入口函数
- 字符串 => 选择器/创建标签
- Dom => JQuery对象（伪数组,Dom集）
// 经典案例
- 开关灯
- 下拉菜单
- 突出显示
- 手风琴
- 淘宝精品
- Tab栏切换
- 动画版下拉菜单
~~~

