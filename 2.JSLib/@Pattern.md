#### 单例模式

> 一个构造函数只有一个实例

**封装**

~~~js
const Singleton = (function(){
  function Instance(name){
    this.name=name
  }
  let obj = null
  return function(...args){
    if(!obj){
      obj=new Instance(...args)
    }
    return obj
  } 
}())
~~~



#### 发布订阅者

~~~shell
# 发布者和订阅者解耦
# 触发事件 => 调度中心(全局) => 响应事件
~~~

##### Class版本

~~~js
// 事件容器 => 事件数组
handlers = {}
~~~

~~~js
// 添加事件
addEventListener (type, handler) {
  // 判断handlers有没有type事件
  if (!(type in this.handlers)) {
    this.handlers[type] = []
  }
  // 添加方法
  this.handlers[type].push(handler)
}
~~~

~~~js
// 触发事件
dispatchEvent (type, ...params) {
  // 无效事件抛出
  if (!(type in this.handlers)) {
    return new Error('未注册该事件')
  }
  // 便利触发
  this.handlers[type].forEach(handler => {
    handler(...params)
  })
}
~~~

~~~js
// 移除事件
removeEventListener (type, handler) {
    // 无效事件抛出
    if (!(type in this.handlers)) {
      return new Error('无效事件')
    }
    if (!handler) {
      // 移除事件
      delete this.handlers[type]
    } else {
      const idx = this.handlers[type].findIndex(ele => ele === handler)
      // 抛出异常事件
      if (idx === undefined) {
        return new Error('无该绑定事件')
      }
      // 移除事件
      this.handlers[type].splice(idx, 1)
      if (this.handlers[type].length === 0) {
        delete this.handlers[type]
      }
    }
}
~~~

#### 观察者

#### 策略