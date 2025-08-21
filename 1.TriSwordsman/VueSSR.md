### VueServerRenderer基本

~~~shell
npm i vue vue-server-renderer koa @koa/router
npm i nodemon -g
~~~

~~~js
let app = new Koa()
let router = new Router()
// 路由
app.use(router.routes())
app.listen(3000)
~~~

~~~js
// 创建Vue
let vm = new Vue({data(){},template:''})
let template = fs.readerFileSync('./temp.html','utf8')
// 渲染Vue
let render = VueServerRenderer.createRenderer({template})
// 路由
router.get('/',async (ctx)=>{
  ctx.body = await render.renderToString(vm)
})
~~~

### Webpack配置

~~~shell
# loader安装
- vue-loader vue-template-compiler vue-style-loader css-loader
- babel-loader @babel/core @babel/preset-env
- html-webpack-plugin
- webpack-merge webpack-dev-server
~~~

### SSR特点

**SSR优势**

- SSR服务端渲染（页面服务端渲染后，返回给前端）
- spa页面<div id=app>，无法爬取dom元素不利于seo优化
- 多页面有利于SEO优化，原生开发建立多Html实现seo
- vue-server-render，vue实现在node中解析vue，将实例渲染成字符串
- 预渲染（启动一个浏览器 生成html，加载这个页面的时候先显示html在进行替换，适合静态页面渲染）

**SSR缺陷**

- SSR会占用更多服务器内存（缓存）
- 浏览器一些api无法正常使用  beforeCreate（created）

### SSR原理

- SPA页面渲染后发起ajax请求数据，用请求的数据渲染页面（js很大，首屏白屏问题），服务端渲染在后台请求数据直接用于渲染（可以减少白屏时间）
- 通过一份代码打包两份代码，用node渲染打包的结果》字符串（没有交互）》再把另一份打包的结果插入到界面中