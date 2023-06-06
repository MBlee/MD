# 支付

**支付流程：**

~~~shell
# 页面逻辑
1. 立即购买 → 确认订单
2. 提交订单（支付方式） → 付款
# 核心
# 1. 立即购买 => Ajax请求（用户|订单金额|订单商品） => 返回订单号（跳转订单页）
# 2. 支付方式 => Ajax请求（订单号|appid|支付方式）=> 返回true|支付方式标识|支付方式对比
# 传参（app_id,channel,title,total_free,bill_no,bill_timeout）
# 3. 对接官方支付 => 数据传递给官方 => 返回结果
~~~

- 创建订单参数


- 提交订单参数

~~~shell
# 提交参数
- app_id
- channel
- title|total_fee
- bill_no|bill_timeout
# 返回参数
- data.result_code
~~~

- 付款参数

~~~shell
- channel
# 支付宝
- paySrc(data.order_string)
# 微信
- paySrc({
  appid,
  noncestr,
  package,
  partnerid,
  prepayid,
  timestamp,
  sign
})
~~~

1. **前端支付**
2. **小程序支付**

# 登录

# 上传下载

**下载：**

~~~js
// Blob下载：1.读取url为blob	2.blob转url	3.a.click()
function download(url){
  const xhr = new XMLHttpRequest()
  xhr.open('GET',url)
  xhr.responseType = 'blob'
  xhr.send()
  xhr.onload = function(){
    const fileBlob = xhr.response
    const fileUrl = URL.createObjectURL(fileBlob)
    const eleA = document.createElement('a')
    eleA.click()
  }
}
~~~

**上传：**

~~~js
// Blob二进制数据
new Blob([str],{type:'text/plain'})
blob.text().then(res=>{})
~~~

~~~js
// 文件读取
// FileReader
fileReader.readAsDataURL|text()
fileReader.onload = (e)=>{e.target.result}
// URL
URL.createObjectURL(blob)
~~~

# 地图

**定位**

~~~shell
# navigator.geolocation
- getCurrentPosition(e =>{e.coords.longtitude|latitude})
~~~

**百度地图**

~~~js
// 百度地图API
1.申请百度开发者 > 2.获取密钥ak >3.使用相关功能
// 基本使用
- new BMap.Map('container|id')
- new BMap.Point(116.404,39.915)
- map.centerAndZoom(point,3|3-19)
- map.panTo(new BMap.Point(116.404,39.915))
- map.enableScrollWheelZoom(true) //滚轮缩放

// 地图控件
- map.addControl(new BMap.NavigationControl())//平移缩放
- map.addControl(new BMap.OverviewMapControl())//缩略地图
- map.addControl(new BMap.ScaleControl())//比例尺
- map.addControl(new BMap.MapTypeControl())//地图类型

// 标注
new BMap.Icon('x.png',new BMapSize(25,35))
new BMap.Marker(point,{icon:myIcon})
map.addOverlay(marker)
new BMap.InfoWindow('message',{width:200,height:150,title:"title"})
marker.onclick =()=>{
  map.openInfoWindow(infoWindow,point|map.getCenter)
}
~~~

文件预览|二维码|在线客服|SEO|混合开发|国际化|语音|聊天

# 音视频

**原生**

```js
// video标签
- src,poster,width
- controls，muted,autoplay,loop
- preload
// audio标签
- src
- controls，muted,autoplay,loop
- preload
// source标签
- src
- type
```

```js
// video属性方法
- playbackRate
- volume
- duration
- currentTime
- paused
- videoWidth
+ play()
+ pause()
+ load()
// video事件
- onloadstart
- onloadedmetadata
- onloadeddata
+ oncanplay
+ onplay
+ onpause
+ ontimeupdate
+ onend
- onvolumechange
- onseeked
- onratechange
```

# 直播

```js
// 获取流
navigator.mediaDevices.getUserMedia({video:true}).then(mediaStream=>{})
// 设置流
video.scrObject = mediaStream
// 播放流
video.onloadedmetadata = ()=>{
  video.play()
}
```

