# Npm

#### 查看包

~~~shell
# 查看最新版本
npm info <packge>
# 查看已安装包
npm ls|list -g --depth 0
# 查看包文件夹
npm root -g
~~~

#### 安装包

```shell
# 安装
npm i create-react-app@1.1.1 -g
# ^ 第一位不变
# ~ 前两位不变
# * 全部最新

# 切换原版镜像
nrm use npm
# 登录
npm login
# 发布包
npm publish
# 删除包（72小时内）
npm unpublish --force
```

#### 包配置

```shell
# Http-proxy >> C:/user/.npmrc
npm config delete|rm http-proxy
npm config set http-proxy
# 查看
npm config ls -l
```

#### 安装镜像

```shell
# 安装+配置
npm i cnpm --registry=http://registry.npm.taobao.org -g
npm config set registry http://registry.npm.taobao.org
# 检测安装成功
npm config get registry
# 以管理员身份运行：
set-ExecutionPolicy RemoteSigned
# 清除缓存
npm cache clean --force
# NODE_PATH
# C:\Users\XX\AppData\Roaming\npm\node_modules
```

#### 脚手架问题解决

~~~shell
# 无法拉取模板
npm config set registry https://registry.npm.taobao.org 
npm config set disturl https://npm.taobao.org/dist
~~~

# Nrm

```shell
# 查看
nrm ls|current|test
# 添加删除
nrm add|del
# 切换
nrm use
```

# Yarn

```shell
# 安装卸载
yarn add|remove global|--dev
# 初始化|发布
yarn init|install|publish
# 执行脚本
yarn run env
```

# PNPM

~~~shell
# 节省node_modules空间（重复依赖）
# 软链接（源文件指针，单独文件inode）
# 硬链接（同一地址，共同inode）
- npx pnpm add -g pnpm
- pnpm rm -g pnpm
~~~

~~~js
- pnpm install
- pnpm <cmd>
- pnpm add <pkg|dir|.tar|http:|git> -P|-D|-O|-g
- pnpm remove|rm|uninstall|un 
~~~

