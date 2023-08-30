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

preventDefaultException：/^$/

scrollbar	{fade,interactive}

#### Methods

getCurrentPage： => {x,y,pageX,pageY}

next|prev：time,easing

finishPullUp|closePullUp

refresh

#### Events

scrollEnd：{x，y}

pullingUp