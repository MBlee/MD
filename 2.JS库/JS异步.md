### Promise

```js
// 封装异步1
Promise((resolve,reject)={resolve()})
.then{return ""|Promise.resolve("")}
.catch|finally
// 封装异步2
Promise.resolve|reject
// 多个异步
Promise.all|race
```

### Async|Await

```js
- async fn
- for await（ of ）|for
```

### 兼容

Babel转译器