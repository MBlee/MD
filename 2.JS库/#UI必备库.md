## Swiper

> 导入：`npm i swiper`

```js
.swiper > .swiper-wraper > .swiper-slide
```

```js
import Swiper from 'swiper/bundle';
import 'swiper/css/bundle';
const swiper = new Swiper('.swiper',<opt>);
```

```js
// Swiper配置
direction|mode: 'vertical'
autoplay: 2000
loop: true
speed：200
pagination: {
  el: '.swiper-pagination'
}
navigation: {
  nextEl: '.swiper-button-next'
  prevEl: '.swiper-button-prev'
}
scrollbar: {
  el: '.swiper-scrollbar'
}
// Swiper方法
swiper.slideNext(speed,callback)
swiper.slidePrev(speed,callback)
swiper.slideTo(index,speed,callback)
```

## BetterScroll

#### Options

scrollX|scrollY：true

eventPassthrough：horizontal

momentum：false

snap：{loop：false，threshold：0.1，stepX:100，stepY：100}

click：true

tab：tabname

wheel

preventDefaultException：{ className: /^$/ }

scrollbar	{fade,interactive}

probeType

pullDownRefresh|pullUpLoad

#### Methods

getCurrentPage： => {x,y,pageX,pageY}

next|prev：time,easing

finishPullUp|closePullUp

finishPullDown|closePullDown

refresh

scrollTo(x,y,time,easing)

scrollToElement(el,time,offsetX,offsetY,easing)

#### Events

scrollEnd|scroll(e={x,y})

pullingUp|pullingDown

<!--滚动栏-->

```js
const scroll = new BScroll(el,{
    click:true,tap:'myClick',preventDefaultException:{className:/class/}
	probeType:3,
    pullUpLoad|pullDownRefresh:true
})
scroll.refresh()
scroll.on('scroll|scrollEnd',({x,y}=>...))
scroll.on('pullingUP|pullingDown')
scroll.finishPullup()
scroll.closePullup()
```

<!--轮播图-->

```js
const scroll = new BScroll(el,{
    click:true,tap:'myClick',preventDefaultException:{className:/class/}
    probeType:3,
    snap:{loop,threshold:0.1},
    momentum:false,
    scollX:true,eventPassthrough:horizontal       
})
scroll.on('scrollEnd',()=>{})
scroll.getCurrentPage => {x,y,pageX,pageY}
scroll.next()|prev()
```

