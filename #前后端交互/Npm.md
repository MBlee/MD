# Npm

### 安装包

~~~shell
# 安装
npm i create-react-app@1.1.1 -g
# ^ 第一位不变
# ~ 前两位不变
# * 全部最新
~~~

### 查看包

```shell
npm list -g --depth 0
npm root -g
npm info jQuery
```

### 发布包

~~~shell
# 切换原版镜像
nrm use npm
# 登录
npm login
# 发布包
npm publish
# 删除包（72小时内）
npm unpublish --force
~~~

### 安装镜像

~~~shell
# 安装+配置
npm i cnpm --registry=http://registry.npm.taobao.org -g
npm config set registry http://registry.npm.taobao.org
# 检测安装成功
npm config get registry
#以管理员身份运行：
set-ExecutionPolicy RemoteSigned
# NODE_PATH
# C:\Users\XX\AppData\Roaming\npm\node_modules
~~~

# Nrm

~~~shell
# 查看
nrm ls|current|test
# 添加删除
nrm add|del
# 切换
nrm use
~~~

# Yarn

~~~shell
# 安装卸载
yarn add|remove global|--dev
# 初始化|发布
yarn init|install|publish
# 执行脚本
yarn run env
~~~
