```java
// import java.lang
import java.util.Scanner;
import java.text.NumberFormat;
import java.text.DecimalFormat;
import java.io.IOException;
import java.util.Arrays;
```

## 第一章 Java概述

```java
// javac .java => java .class => JVM解释执行 (Eclipse/Netbeans)
public class FileClass{
    public static void main (String args[]){
        System.out.println('hello world')
    }
}
// 输入输出
new Scanner(System.in)
scan.next|nextInt|nextFloat
scan.nextLine
```

## 第二章 数据和表达式

```java
long a=10L
float f=10.0f
char c='\u???'
boolean b=true
int i=(int)10L
// 数值类
NumberFormat.getInstance()
format.setMaximumFractionDigits(int)
format.setMaximumIntegerDigits(int)
format.format(num)
new DecimalFormat('0.##')
decimal.format()
decimal.applyPattern()
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
label: for... break,continue label
```

```java
// 异常处理
Throwable => Exception|Error(Unchecked Exception)
Exception => Checked Exception|RuntimeException
System.exit(0)
try{}catch(IOException e){}finally{}
public void method() throws Exception,...
```

## 第四章 面向对象程序设计

```java
public class CLS extends PCLS{}
public CLS(){ this() }
(static) private int a
(static) public void toXX(){ this|super.xx() }
Integer.parseInt()...
```

## 第五章 数组和字符串

```java
String strArr[] = String[] strArr
String arr[][] = String[][] arr
strArr = {...}
strArr = new String[n]
System.arrayCopy(a1,start,a2,start,count)
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

```java
// 子类
Object.getClass()
Object.equal()
Object o=new Child()
o instanceof Child
Child c=(Child)o
// 方法覆盖与多态
super()
super.method()
// 接口
implements inter1,...
interface(final,static)(public,abstract)
// 终极类与抽象类
final class
final int a
final int method()
abstract class
abstract method()
```

## 第七章 输入和输出流

#### 数据流

#### 基本字节数据流类

#### 基本字符流

#### 文件处理