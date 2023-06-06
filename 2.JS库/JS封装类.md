## 工具封装

#### 节流

```js
function throttle(callback,wait){
    let start = 0;
    return function(e){
        let now = Date.now();
        if(now-start >= wait){
            callback.call(this,e);
            start = now;
        }
    }
}
```

#### 防抖

```js
function debounce(callback,wait){
    let timer = null;
    return function(e){
        if(timer !== null){
            clearTimeout(timer)
        }
        timer = setTimeout(()=>{
            callback.call(this,e)
            timer = null
        },wait)
    }
}
```

## 原理封装

#### call/apply/bind

~~~js
//call|apply
function call(Fn,obj,...args|[args]){
    if(obj === undefined || obj===null){
		obj = globalThis;
    }
    obj.temp = Fn;
    let result = obj.temp(...args);
    delete obj.temp;
    return result;
}
//bind
function bind(Fn,obj,...args){
    return function(...args2){
        return call(Fn,obj,...args,...args2)
    }
}
~~~

#### flat

~~~js
function flat(arr,bool){
  let res = []
  for(let key in arr){
    if(typeof arr[key] === 'object'){
      res = bool?res.concat(flat(arr[key])):res.concat(arr[key])
    }else{
      res.push(arr[key])
    }
  }
  return res
}
~~~

#### reduce

~~~js
function reduce(arr,cb,initVal){
  let res = initVal
  arr.forEach(item=>{
    res = cb(res,item)
  })
  return res
}
~~~

