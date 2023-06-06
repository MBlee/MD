## 前端攻击

**XSS**

攻击：

反射型，输入提交到服务器，解析后xss代码到浏览器，浏览器执行。

存储型，存储到服务器，加载执行代码。

防御：

1. 对用户输入处理HTMLEntity编码
2. 正则过滤，过滤不安全内容|DOM属性|Script

CSRF

SQL

## SEO优化

**vue-meta-info**

- metaInfo.meta
  - title|titleTemplate
  - description
  - keyword
  - robots

**prerender-spa-plugin**

**nuxt.js**

- 基于vue的SSR服务器渲染框架，把vue渲染成html给浏览器

**react-snap**

## JS与原生交互

#### 安卓

- 原生调用JS

  ~~~shell
  # 4.4版本之前
  # mWebView = new WebView(this); #当前webview对象
  # 通过loadUrl方法进行调用，参数通过字符串方式传递
  # 也可以在UI线程中运行
  mWebView.loadUrl("javascript:方法名('参数1...')")
  ~~~

  ~~~shell
  # 4.4版本之后
  # 通过异步执行JS代码，并获取返回值
  mWebView.evaluateJavascript("javascript:方法名('参数1...')",newValueCallback(){
    # 执行回调
    public void onReceiveValue(String value){}
  })
  # 不适合传大数据（URLScheme）
  ~~~

- JS调用原生

  ~~~shell
  # 获取webView的设置对象，方便后续修改
  WebSettings webSettings = mWebView.getSettings();
  # 设置Android允许JS脚本，必须要！！！
  webSetting.setJavaScriptEnabled(true);
  # 暴露一个叫JSBridge的对象到webView全局环境
  mWebView.addJavascriptInterface(getJSBridge(),'JSBridge')
  ~~~

  ~~~shell
  # JS调用
  window.JSBridge.foo();
  ~~~

#### IOS

## 浏览器缓存

## CDN

## Vue|React优缺点

## Vue2|Vue3

## HTTP|TCP

## TS

## Nuxt

