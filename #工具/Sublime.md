预览HTML：build > cmd:explorer.exe, $file

## 快捷键

合并行：ctrl+j

删除行：ctrl+x

复制行：ctrl+shift+D

插入行：ctrl+enter

多选单词：ctrl+D

全选单词：alt+F3

## 常用插件安装

**代码提示**

~~~shell
# SublimeText-Nodejs
1. 文件名改为Nodejs
2. 文件Nodejs.sublime-build，
"encoding": "cp1252" 改 
"encoding": "utf8" ，
"cmd": ["taskkill /F /IM node.exe & node", "$file"] 改 
"cmd": ["node", "$file"]
3. 文件“Nodejs.sublime-settings”，
"node_command": false 改 
"node_command": "D:\\Program Files\\nodejs\\node.exe" ，
"npm_command": false 改 
"npm_command": "D:\\Program Files\\nodejs\\npm.cmd" 
~~~

~~~shell
# sublimecodeintel
~~~

~~~shell
# sublimeServer
~~~

**代码跳转**



## Errors

##### CMD默认打开两个窗口

> 在User Setting 当中添加："hot_exit": false, "remember_open_files": false