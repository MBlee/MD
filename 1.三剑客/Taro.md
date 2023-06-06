### 基本语法

**生命周期|state**

~~~js
- render()||config||state(this.setState(,fn))
- componentwill||DidMount
- componentwillUnmount
- componentDidShow||hide
- componentWillUpdate||shouldComponentUpdate
- componentWillReceiveProps
~~~

**props**

~~~js
- this.props
- child.defaultProps = {}
~~~



### 项目配置

~~~shell
# 安装|创建
npm i -g @tarojs/cli
taro init xxxApp
# 运行
npm run dev:h5|weapp|alipay|swan|rn
# 配置:H5
config=>devServer:{port,host}
~~~

~~~shell
# 项目目录：
- config|package.json|project.config.json
- app.jsx|app.less
~~~

