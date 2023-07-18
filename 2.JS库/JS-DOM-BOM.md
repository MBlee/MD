# DOM

### DOM树

~~~js
// 查取
- parentNode|children|sibilingElement
// 添加
- createElement|appendChild|insertBefore
// 删除
- removeChild
~~~

### DOM元素

~~~js
// 查取DOM
- getElementById|getElementsByTagName
- getElementsByClassName|querySelectorAll
// 动态数据
- innerHtml|innerText
// 动态样式|属性
- style|className|classList
- attrs...
- removeAttribute
- hasAttribute('')
// 动态事件
- onload(attachEvent|detachEvent)|null
- addEventListener|removeEventListener
~~~

~~~shell
# 常用事件
- touchstart|move|end
- mouseenter|over|move|leave
# 事件对象
- e.targetTouches|touches|changedTouches
- e.target(触发对象)
- e.currentTarget(绑定对象)
~~~

~~~js
// 触摸事件
touchStart|end:	e => {	e.changeTouches.pageX - prePageX<5	}
~~~

### 定位系列

~~~js
// Offset定位
- offsetTop|Left //定位父距离
- offsetWidth|Height //含Border
- offsetParent //定位父
// client
- clientTop|Left //盒子边距
- clientWidth|Height //不含Border
// scroll
- scrollTop|Left //滚动距离
- scrollWidth|Height //实际大小不含Border
- window.pageXOffset|documentElement|body
- scrollTo|scroll|scrollBy
// 鼠标定位
+ pageY //页面含滚动
+ clientY //页面不含滚动
+ offsetY //内填充边
+ scrennY //屏幕
~~~

# BOM

### Location

~~~shell
# 属性
- href
- host|port
- pathName|search|hash
~~~

~~~shell
# 方法
- assign(href)
- replace(href)
- reload(true)
~~~

### Navigator

~~~shell
# 属性
- navigator.userAgent
# 方法
~~~

### History

### SetTimeout

### SetInterval
