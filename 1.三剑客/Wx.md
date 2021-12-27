### 项目目录

必备：app.json, pages, app(), page()

### 生命周期

app：

onlaunch(), onShow

onHide

pages：

onLoad(obj), onReady, onShow

onHide, onUnload

### 指令

wx:if, wx:for, wx:for-item

include, import.src

template.is, data

### 事件

- 类别：tap, longtap

  touchstart, end, move, cancel

  submit, input

- 冒泡：bind, catch

- event.currentTarget, target

  dataset: 自定义属性

### 跳转

- wx.navigateTo({url?})

  wx.redirectTo({url?})

- navigator.url, redirect

### 组件

- scrollview

  scroll-y, scroll-top, scrolltoupper, upper-treshold, scroll-into-view

- swiper

  indicator-dots, autoplay, interval, duration

- icon

  type, size, color
  
- text
  
- progress
  
  percent, show-info, color, active
  
- button
  
  size, type, plain
  
- checkbox, radio
  
  value, disabled, checked
  
- form
  
  submit, reset
  
- input
  
  value, type, change
  
- label
  
- picker
  
  mode, range, value, change
  
- slider, switch
  
- action-sheet, action-sheet-item, cancel
  
  hidden
  
- modal
  
  title, confirm-text, cancel-text, hidden
  
- toast
  
  duration, change, change
  
- loading
  
  change
  
- navigator
  
  url, redirect, hover-class
  
- image
  
  url, mode, load
  
- audio
  
  action, src, loop, controls, play, pause, update, ended
  
- map
  
  longitude, latitude, scale, markers, covers
  
- canvas
  
  canvas-id, error
  

### API

- wx.request(obj)

  url, data, header, complete

- wx.chooseImage

  count, sizeType, sourceType

  res.tempFilePaths

- wx.uploadFile

  url, filePath, key

- wx.downloadFile

  url, type, res.tempFilePath

- wx.connectSocket

  url, data

- wx.onSocketOpen, message, close

  data

- wx.sendScoketMessage, closeSocket

- wx.getBackgruondAudioPlayerState

- wx.playBackgroundAudio, pause, seek

- wx.onBackgroundAudioPlay, pause, stop

- wx.setStorage, get, clear

- wx.getLocation, open, choose

  type, complete

- wx.getNetworkType

  res.networkType

- wx.getSystemInfo

- wx.makePhoneCall

- wx.showToast, modal, ActionSheet

- wx.setNavigationBarTitle, showNavigationBarLoading

- wx.navigateTo, redirectTo, navigateBack

- wx.createAnimation

  duration, timingFunction, delay, transformOrigin

  animation.export()=>animation

  animation.rotate(90).step(), scale(), translate(), skew(), matrix

- wx.createContext

- wx.drawCanvas, drawImage

  canvasId, actions

- wx.canvasToTempFilePath

  canvasId

### 微信支付

- API：wx.requestPayment

  - 参数：timeStamp, nonceStr

    package, paySign / signType

    success, fail, complete

  

 