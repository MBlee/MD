# Angular

## Angular简介

AngularJS/Angular2/4/5（路由）

#### 项目搭建：

```shell
# 安装@angular/cli
npm i -g @angular/cli
# 创建项目
ng new xxx
npm i
# 运行
ng serve --open
```

# Typescript

```shell
# 安装
npm i -g typescript
# 编译
tsc .ts
# 任务→监视tsconfig.json
tsc --init
```

### 数据类型

- 基本类型 ：number|boolean|string
- 数组类型：string[] / Array<string>
- 元组类型：[string, number, boolean]
- 枚举类型：enum e{ success=1 ,error = -1 }     :e

# JQuery

### 常用API

入口函数：**$(document).ready(fn) / $(fn)**

jQuery对象：**$('selector'/dom)**

文本：**text()**

样式：**css()**

事件：**click()**

# JQuery

```js
$(fn);
// Dom操作：
$(str).children/find/parent/siblings/next/prev/:eq(index)/:odd/:even
$(str).click(fn)
$(str).text(str)
$(str).css(strs/obj).show/hide()
```

# Less

- 编译：lessc，easy less

```js
变量：@，@{ }
嵌套：&
混合：(@_)(A，@...)
```

# Sass

```js
// 数据类型
1. 字符串（引号_#{}）
2. 数字（单位）/布尔（false_null）
3. 数组（空格_逗号__括号）
4. 映射（括号_键值对）
5. 颜色（rgba(#hex,opacity)）
// 安装
Node安装node-sass/dart-sass
Ruby/Dart的sass模块
webstorm→配置自动命令→scss插件
vscode→Easy Sass和Sass插件
node-sass  scss  css
node-sass  c  -o  d
node-sass  -w  scss  -o  css
```
