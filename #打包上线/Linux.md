#### Linux简介

**版本：**Ubuntu、RedHat、CentOS

**特点：**[安全性]()、[稳定性]()、[高并发]()

> 安装：虚拟机 > 创建虚拟机 > 镜像

**目录结构：**[/](/)：根目录

- [bin | usr/bin]()：系统可执行文件（任何目录）

  [usr/local/bin](usr/local/bin)：用户可执行文件

  [etc]()：系统配置文件，配置环境变量（etc/profile）

  [home]()：用户根目录

  [opt]()：存档额外安装的软件

#### Linux命令

#### Linux常用命令

~~~shell
# 查看IP
ifconfig

~~~



~~~shell
# 列出当前目录内容，-a隐藏文件
ls -a
# 文本内容
cat 文本文件
~~~

#### Vim

~~~shell
# Vim模式
shift:
a|i 
# 退出
q!|wq|q
~~~

**快捷键**

~~~shell
# 复制行
yy|5yy => p
# 删除行
dd|5dd
# 撤销
u
# 查找
:/keyword => n
# 显示行号
:set nu|set nonu
~~~