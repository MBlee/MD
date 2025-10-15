## 第一章 Java概述

#### Java示例

```java
// javac .java => java .class => JVM解释执行 (Eclipse/Netbeans)
public class FileClass{
    public static void main (String args[]){
        System.out.println('hello world')
    }
}
```

#### Java语言简介

```shell
# 特点
- 语法简单，功能强大，安全可靠
- 与平台无关
- 解释编译两种运行方式
- 多线程
- 动态执行且具有丰富的API文档及类库
# 与平台无关
# Java虚拟机
JVM是一台虚拟计算机，是通过在实际的计算机上仿真模拟各种计算机功能来实现的。不同的操作系统有不同的虚拟机，它类似一个小巧而高效的CPU。
```

#### 面向对象技术

```shell
包括OOA、OOD、OOP，JAVA所有数据类型都有相应的类，程序可以完全基于对象编写。
# OOP
对象特性：状态（属性/数据），行为（方法）
封装：将数据及对数据的操作捆绑在一起成为类，这就是封装技术。
继承：将一个已有类中的数据和方法保留，并加上自己特殊的数据和方法，从而构成一个新类，这就是继承。
多态：在一个类和多个类中，可以让多个方法使用同一个名字，从而具有多态性。
```

#### 核心API文档 

#### 环境安装配置

```shell
JDK：Java编译器javac.exe、Java解释器java.exe。
# 软件安装
/jre：Java运行环境（Java虚拟机、运行类库）
/bin/javac：将Java程序编译成字节码
/bin/java：执行已经转换字节码的Java程序
/bin/jdb：调试Java程序
/bin/javap：反编译，将类文件还原回方法和变量
/bin/javadoc：文档生成器，创建HTML文件
# 环境变量
CLASSPATH：%JAVA_HOME%\lib; %JAVA_HOME%\lib\tools.jar;
Path：%JAVA_HOME%\bin; %JAVA_HOME%\jre\bin;
```

## 第二章 数据和表达式

#### 语法

```shell
# 注释 - 关键字 - 标识符（风格）- 数据类型 - 常变量 - 表达式（运算符/操作数/提升和转换/优先级）
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