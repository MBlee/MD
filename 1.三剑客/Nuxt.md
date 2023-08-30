## Nuxt

## 服务端渲染

```shell
npm i vue vue-server-renderer -S
```

```js
// 创建Vue实例
const Vue = require('vue')
const app = new Vue({
  template:`<div/>`
})
// 渲染为HTML
const renderer = require('vue-server-renderer').createRenderer()
renderer.renderToString(app,(err,html)=>{
  if err throw err;
})
renderer.renderToString(app).then(html=>{})
```



