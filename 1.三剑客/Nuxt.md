## Nuxt2.14.5

```shell
npx create-nuxt-app <app>
npm i nuxt@2
nuxt
```

## Nuxt3

```shell
npx nuxi@latest init <app>
npm run dev -o
```

## Nuxt

```css
yarn create nuxt-app <app>
```

> layouts=>pages=>components

```jsx
// layouts=>default.vue
<Nuxt />
// nuxt.config.js
component:true
```



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
// 渲染HTML
const renderer = require('vue-server-renderer').createRenderer()
renderer.renderToString(app,(err,html)=>{
  if err throw err;
  res.end(html)
})
renderer.renderToString(app).then(html=>{})
```

```js
// HTML模板=>
{{{html}}}
{{data}}
<!---vue-ssr-outlet--->
// 渲染HTML
const renderer = require('vue-server-renderer').createRenderer({
    template:fs.readFileSync('filepath','utf-8')
})
renderer.renderToString(app,{
	data,div
},(err,html)=>{
  if err throw err;
    return res.status(500).end('error')
  res.setHeader('Content-Type','text/html;charset=utf-8')
  res.end(html)
})
```

