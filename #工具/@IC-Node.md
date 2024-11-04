## CentOS8

> node包: https://registry.npmmirror.com/binary.html?path=node/

```shell
#! Linux安装1: tar.gz
# 1.解压:/usr/local/soft
tar -zvxf tar.gz
# 2.链接文件:/usr/bin/
ln -s ./bin/node  /usr/bin/node
# npm设置源
npm config set registry=https://registry.npmmirror.com
# 检测
npm|node -v
```

```shell
#!Linux安装2: w-get
# 1.解压
w-get .tar.xz
xz -d .tar.xz
tar -zvxf .tar.gz
# 2.环境变量
vi /etc/bashrc
eport PATH=$PATH:/node/bin
```

```shell
#!Linux安装3：nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install 16.0.0
nvm use 16.0.0
```

## Win10

```shell
# nvm-windows
nvm list available
nvm ls
nvm current
# 安装卸载
nvm install|uninstall [version]
nvm alias|unalias
nvm use [version]
```