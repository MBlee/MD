## 基配

```shell
npm i -g create-react-app
# 初始化项目
create-react-app <pro-name>
```

#### **React17**

~~~shell
# packge.json
react|react-dom: ^17.0.2
testing-library/react: ^12.1.5
~~~

~~~js
// index.js
import ReactDOM from 'react-dom'
const root=document.getElementById('root')
ReactDOM.render(<App />,root)
~~~

#### **React18**

> 目录：public/index.html，src/index.js
>
> npm i  [react  react-dom  react-scripts]()

> `react-scripts   start|build`

```js
// index.js
import ReactDOM from 'react-dom/client'
const root = ReactDOM.createRoot(dom)
root.render(App)
```

#### **Next**

```shell
# 手动
yarn add react react-dom next
# 自动
yarn create next-app
```

> Scripts：[next]()|[next build]()|[next start]()
>
> 端口：next -p 5000

> pages自动分配路由

## 详配