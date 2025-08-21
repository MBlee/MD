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
