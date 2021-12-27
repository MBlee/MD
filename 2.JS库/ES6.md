### ES5-严格模式

- `'use strict'`

- ```js
  //*必须用var
  //*禁止this指向window
  //*创建eval作用域
  //*对象属性不能重名
  ```

### ES5-JSON对象

```js
//JSON和JS转换
JSON.stringify(arr/obj)
JSON.parse(json)
```

### ES5-Object方法扩展

```js
//以对象为原型，创建新对象
//value_writable_configurable_enumerable
Object.create(obj,{})
//为对象扩展属性
//get:获取_return
//set:修改
Object.defineProperties(obj,{})
//对象遍历
Object.keys(obj).map
```

### ES5-数组的扩展

~~~js
//数组字符串
arr.toString/join
//获取值下标
arr.indexOf/lastIndexOf(value)
//遍历数组
arr.forEach/map
//过滤数组
arr.filter(fn,thisValue)
//排序数组
arr.sort(random)
arr.reverse
//增删数组
arr.push/pop/shift/unshift
~~~

