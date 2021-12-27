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

### 安装镜像

~~~shell
# 安装+配置
npm i cnpm --registry=http://registry.npm.taobao.org -g
npm config set registry http://registry.npm.taobao.org
#以管理员身份运行：
set-ExecutionPolicy RemoteSigned
~~~

