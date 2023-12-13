### JS定位

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

**Window**

innerHeight

```js
// 获取视口位置|大小
getBoundingClientRect()		=>x,y|width,height
// 交界监听器
intersectionObserver((entries)=>{},{root,rootMargin,threshold})
```

### JS动画

**匀速运动**

timer, offsetTop > style

**轮播图**
