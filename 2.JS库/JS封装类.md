### call/apply/bind函数封装

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

### 节流

~~~~js
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
~~~~

### 防抖

~~~js
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
~~~



