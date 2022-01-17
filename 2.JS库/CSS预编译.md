### SCSS

编译插件：Live Sass Compiler > settings

嵌套：

- 选择器嵌套|&父选择器|属性嵌套
- 占位符选择器%xxx须通过@extend

变量：

- $xxx-_xxx
- !global|!default

### LESS

### Stylus

~~~shell
# 安装
npm install stylus -g
# 用法
stylus -w xxx.styl -o xxx.css
~~~

选择器：

- 缩进 空格，逗号|换行
- 父级&，^[N]局部引用
