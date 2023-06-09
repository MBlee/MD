### 正则表达式

> 创建：/xxxStr/ ，eval(\`/${xxxVar}/\`)， new RegExp("xxx",...)

|  数字   | 数字字母下划线 |  空白   |   转义   |         字符          |
| :---: | :-----: | :---: | :----: | :-----------------: |
| \d \D |  \w \W  | \s \S | \/ \ . | \p{L\|N\|P\|sc=Han} |

|   原子表   |         断言         |
| :-----: | :----------------: |
| [^-] \| | (?=)(?<=)(?!)(?<!) |

|                原子组                 |    0或多个     |
| :--------------------------------: | :---------: |
| (?:)(?<>)，\0\1 ，$1|\$&\|\$<>\|\$`' | ?，*，+，{x,y} |

~~~shell
# 修饰符
- 全局：g
- 多行：m|s
- 忽略大小写：i
- 字符编码：u
+ 高效：y
~~~

### 方法

~~~shell
# 正则方法
- reg.test(xxStr)
- reg.exec(xxStr)
# 属性
- reg.lastIndex
~~~

~~~shell
# 字符串查找
- match()，reg=> null|[,]
- search()，reg=> -1|index
# 替换
- replace()，(reg, str|fn)=>newStr
~~~

~~~js
// matchAll封装
~~~

### 案例

~~~shell
# 邮箱
reg = /^[\w-]+@([\w-]+\.)+(com|cn|cc|org|net)$/i
# 手机号
reg = /^((0\d{2,3}-\d{7,8}|1[3-9]\d{9}))$/
# 用户名
reg = /^[a-z][\w-]{2,7}$/i
# 密码
reg = /^[a-z0-9]{5,10}$/i，/[A-Z]/，/[0-9]/
~~~

~~~shell
# 模糊手机号
str.replace(/\d{9}$/,res=>'*'.repeat(res.length))
# 限制关键词
~~~

~~~shell
# 查找console.log
console\.log\(.*\)
~~~

