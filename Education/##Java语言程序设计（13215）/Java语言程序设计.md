## 第一章 Java概述

#### Java语言简介

```shell
# 特点
- 语法简单，功能强大，安全可靠
- 与平台无关
- 解释编译两种运行方式
- 多线程
- 动态执行且具有丰富的API文档及类库
```

#### 面向对象技术

#### 环境安装配置

```shell
# 软件包
# 软件安装
# 环境变量
```

#### Java示例

#### 核心API文档 

## 第二章 数据和表达式

#### 语法

```shell
# 注释 - 关键字 - 标识符（风格）
```

#### 数据类型

```shell
字节数/长度/表示范围
# 基本类型
- 数值类型（int/long/short-float/double）
- 字符类型（char）
- 布尔类型（boolean）
# 复合类型
- 类类型
- 接口类型
- 数组类型
```

#### 表达式

```shell
# 操作数
- 变量/常量/数学
- 屏蔽/冲突 
```

```shell
# 运算符
- 算术/比较/逻辑
- 位
# 优先级
```

```shell
# 表达式提升和转换
- 强类型转换
```

## 第三章 流程控制语句

```java
package pkg[.pkg1]
import pkg.*
// 流程控制
if(boolean)else{}
switch(){case:case:default:}
for(;boolean;){}
for(int x:xs){}
while(boolean){}
do while(boolean)
```

```ts
// 输入输出
new Scanner(System.in)
scan.next|nextInt|nextFloat
scan.nextLine
// 数值类
NumberFormat.getInstance()
format.format(num)
format.setMaximumFractionDigits(int)
format.setMaximumIntegerDigits(int)
new Decimal('0.##')
```

```java
// 异常处理
Throwable => Exception|Error(Unchecked Exception)
Exception => Checked Exception|Runtime Exception
- ArithmeticException
- NullPointerException
- NegativeArraySizeException
- ArrayIndexOutofBoundsException
try{}catch(IOException e){}finally{}
public void method() throws Exception,...
```

## 第四章 面向对象程序设计

```java
public class CLS extends PCLS{}
public CLS(){}
(static) private int a
(static) public void toXX(){}
Integer.parseInt()...
```

## 第五章 数组和字符串

```java
String strArr[] = String[] strArr
String arr[][] = String[][] arr
strArr = {...}
strArr = new String[n]
System.arrayCopy(a1,start,a2,start,count)
package java.util.Arrays
equals()
sort()
fill()
binarySearch()
```

```java
package java.util
Vector<String> vec = new Vector<String>(capacity,increment)
addElement(E obj)
add(int idx,E obj)
insertElementAt(E obj,int idx)
```

```java
String str = new String(char[])
StringBuffer str = new StringBuffer(str)
// String/StringBuffer
length()
charAt(int idx)
subString(int beginIdx)
// String
replace(char oldChar,char newChar)
toLowerCase()
toUpperCase()
concat(String str)
startsWith(String prefix)
trim()
valueOf(type val)
// StringBuffer
append(String str)
replace(int start,int end,String str)
capacity()
equal|==
```

## 第六章 继承与多态

#### 子类

#### 方法覆盖与多态

#### 终极类与抽象类

#### 接口

## 第七章 输入和输出流

#### 数据流

#### 基本字节数据流类

#### 基本字符流

#### 文件处理