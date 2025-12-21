```java
// import java.lang
import java.util.Scanner;
import java.util.Arrays;
import java.text.NumberFormat;
import java.text.DecimalFormat;
import java.io.IOException;
import java.io.Serializable;
import java.io.File;
import java.awt.*;
import javax.swing.*;
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

```java
// IOException/FileNotFoundException
// Reader/Writer
abstract InputStream/OutputStream
in.available().read().close()
out.write().close().flush()
```

```java
// FileInputStream
FileInputStream in = new FileInputStream('file.dat')
while(in.available()>0) in.read()
in.close()
FileOutputStream out = new FileOutputStream('file.dat')
out.write(''|n)
out.close()
// BufferedInputStream
new BufferedInputStream(in,1024)
buf.write().flush()
// DataInputStream
new DataInputStream(in)
data.readInt()
// ObjectInputStream(Serializable)
new ObjectInputStream(in)
obj.readObject()
obj.writeObject()
// transient
public transient a
```

```java
// InputStreamReader/OutputStreamReader
input =new InputStreamReader(InputStream)
// FileReader/FileWriter
input =new FileReader('file')
// BufferedReader/BufferedWriter
buffered =new BufferedReader(input)
buffered.readLine().newLine()
while(buffered.readLine()!=null){...}
// PrintWriter/PrintReader
print =new PrintWriter(input)
print.println().close()
```

```java
// File
new File(File|'','file')
file.getName().getPath().getParent().renameTo(File)
file.exists().isFile()
file.lastModified().length().delete()
mkdir/mkdirs()
list()
// RandomAccessFile
new RandomAccessFile('file','rw')
file.getFilePointer()
file.length()
file.seek(pos)
```

## 第八章 图形界面设计

```java
// 容器
JFrame(String)
void setTitle()
void setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE)
void setBounds(int x,int y,int width,int height)
void setSize(int width,int height)
void setBackground(Color bg)
void setVisible(boolean)
void pack()
void setLayout(LayoutManager manager)
Container getContentPane()
void setContentPane()
// JPane,JScrollPane,Scrollbar
JPane(LayoutManager layout)
pane.add(button,BorderLayout.CENTER)
JScrollPane(Component view)
sPane.setHorizontalScrollbarPolicy
sPane.setVerticalScrollbarPolicy
// 标签及按钮
JLabel(String|Icon,int=JLabel.LEFT)
label.setHorizontalAlignment(JLabel.TOP)
label.setVerticalAlignment()
JButton(String|Icon=new ImageIcon('img'),int)
button.addActionListener(ActionListener)
button.setEnabled().setText()
class JButtonExp extends WindowAdapter implements ActionListener{
	public void actionPerformed(ActionEvent e)
    public void windowClosing(WindowEvent e)
}
JToggleButton(String|Icon,boolean selected)
JCheckButton/JRadioButton
che.isSelected()
// 布局管理器
// 事件处理
// 绘图基础
```

```java
// 组合框与列表
// 文本组件
// 菜单组件
// 对话框组件
```

## 第十章 多线程

```java
Thread(ThreadGroup group,Runable target,String name)
Thread.currentThread.getName()
Thread.currentThread.isAlive()
new Thread(Runable,name)
// 创建
class T extends Thread{	public void run(){} }
class I implements Runable{	public void run(){} }
// 启动-结束
thr.start()
thr.interrupt()
// 调度
thr.setPriority()
thr.getPriority()
Thread.sleep()
Thread.yield()
// 挂起
thr.sleep()
thr.wait(),notify(),notifyAll()
thr.join()
```

```java
// 多线程概念（结构-状态）
// 线程（创建-启动-调度-结束-挂起）
// 互斥（同步）
```