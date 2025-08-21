## Mui.css

#### 封装类

~~~shell
# header
- mui-bar|mui-bar-nav
# a
- mui-action-back
- mui-icon|mui-icon-left-nav
- mui-pull-left
- mui-navigate-right
# h1
- mui-title
# ul > li
- mui-table-view
- mui-table-view-cell
# 通用
- mui-content
~~~

## Mui.js

#### 初始化

~~~js
// 引入mui
mui.init();
mui.plusReady(function(){
  mui('body').on('tap','#payment',function(){})
})
// 跳转
mui.openWindow({url,id})
// 事件
mui('parent').on('tap','child',function(}))
~~~

