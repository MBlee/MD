### 正则表达式

~~~js
// 字面量，变量
/xxxStr/
`/${xxxVar}/`
// 对象
new RegExp("xxx",...)
~~~

- 数字：\d \D

  空白：\s \S

  字母数字下划线：\w \W

  转义：\ .

- 边界：^$

  多个：+

  选择符：|

  原子组：()

  原子表：[]

- 全局匹配：g

  大小写不敏感：i

### 方法

判断：

- //.test(xxxStr)

### 字符串

查询：match(//)

替换：replace(//|str, newStr|fn)