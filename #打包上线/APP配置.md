## WX

#### 初始化

- 代理 => 不使用代理

- AppID：`wx325d0c46f027bba0`  AppSecret：`94d96a0fda82dce296142dc07264625c`

- project.config.json

- ```shell
  # 云开发环境初始化
  - project.config.json => cloud
  "cloudfunctionRoot":"/cloud"
  - app.js => onLaunch
  wx.cloud.init({
    env:'proID'
  })
  ```

#### 配置

## Uniapp

#### 初始化

- @vue/cli

~~~shell
# 使用正式版
vue create -p dcloudio/uni-preset-vue my-project
# 使用alpha版
vue create -p dcloudio/uni-preset-vue#alpha my-alpha-project
~~~

#### 配置

## Electron

#### 初始化

- 克隆模板

~~~shell
git clone https://github.com/electron/electron-quick-start
~~~

- 脚手架

~~~shell
create-electron-app xxx_app
~~~

#### 配置

~~~shell
# app => BrowserWindow
# Node配置
webPreferences:{
	nodeIntegration:true,
	contextIsolation:false
}
~~~

##  JQuery

#### 初始化

#### 配置