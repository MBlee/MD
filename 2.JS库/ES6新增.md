### ES新增特性

**let|const**

- 不能重复
- 先声明在使用
- 块级作用域


- 变量提升|window对象属性&方法

const

- 声明必须赋值
- 不可改且但引用类型可改

**箭头函数**

- 简洁：(,)=>(obj)
- this=最近作用域
- 不能做构造函数|没有arguments参数

**模板字符串**

`和${变量|表达式|计算|函数}

**属性方法简写**

**剩余参数**

fn(...args), 只能有一个，必须最后一个

**扩展运算符|解构赋值**

- 函数调用
- 数组|对象

**Symbol类型**

- Symbol()作为对象属性名
- 定义类的私有属性|方法

getOwnPropertySymbols|getOwnPropertyNames

**Class类支持**

**模块Import，export**

### 数组新增方法

**filter**

- 返回符合条件的新数组

**some|every**

- 判断有一个符合条件|true

- 判断所有元素都符合条件|true

**map**

- 返回一个新数组

**from**

- Array.from(类数组|对象)=>真数组

**of**

- 将一组值转为数组|Array().of()|Array()

**entries|values|keys**

- 返回迭代器|键值对

- 返回键值对|value

- 返回键值对|key

**flat|flatMap**

- 返回一维新数组
- 只展开一层数组

**fill**

- arr.fill(value, start, end)，填充替换

**copyWithin**

- arr.copyWithin(target, start, end)，复制

**find，findIndex，includes**

1. 找到第1个元素，返回并终止
2. 找到第1个元素下标，返回并终止
3. 判断元素是否存在|indexOf(NaN)

### 浅拷贝Assgin方法

用于对象合并，将源对象所有枚举属性复制到目标对象

- 浅复制（源对象属性为对象）
- 为对象添加属性|方法
- 合并多个对象

### Set集合和map集合

1. 无重复值无序列表（Object.is）
   - set.size, has(), add(), delete(), clear(), forEach(callback, this)
   - 去重，[...set]|Array.from |new Set(arr)
   - WeakSet，对象弱引用|不能遍历
2. 无重复值键值对（Object.is）
   - map.set(), get(), has(), add(), delete(), clear() ,size, forEach(callback, this)

### Promise

Promise((resolve,reject)={resolve()})

.then{return ""|Promise.resolve("")}

.catch|finally

Promise.all|race

Promise.resolve|reject

### Proxy代理
