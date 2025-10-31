#### 4个数组成3位数的个数

（1）1，2，3，4这4个数可以组成多少个不重复的3位数。文件名为1.java,上传到指定网页。

```java
public class CountNumbers {
    public static void main(String[] args) {
        // 题目给定的数字集合
        int[] digits = {1, 2, 3, 4};
        // 用于计数不重复的 3 位数
        int count = 0;
        System.out.println("由 1, 2, 3, 4 组成的不重复 3 位数列表：");
        // i, j, k 分别代表百位、十位和个位上的数字
        // 由于数字是 {1, 2, 3, 4}，我们使用它们的索引 0-3
        // 1. 百位 (i)
        for (int i = 0; i < digits.length; i++) {
            // 2. 十位 (j)
            for (int j = 0; j < digits.length; j++) {
                // 确保十位和百位不重复
                if (i == j) {
                    continue; 
                }
                // 3. 个位 (k)
                for (int k = 0; k < digits.length; k++) {
                    // 确保个位和百位、十位都不重复
                    if (k == i || k == j) {
                        continue;
                    }
                    // 此时 i, j, k 互不相同
                    int hundreds = digits[i];
                    int tens = digits[j];
                    int ones = digits[k];
                    int number = hundreds * 100 + tens * 10 + ones;
                    System.out.print(number + " ");
                    count++;
                    // 每 8 个数字换一行，方便查看
                    if (count % 8 == 0) {
                        System.out.println();
                    }
                }
            }
        }
        System.out.println("\n\n---------------------------------");
        System.out.println("总共有 " + count + " 个不重复的 3 位数。");
        System.out.println("---------------------------------");
    }
}
```

#### 不超5位数（位数/逆序）

输入一个不超过5位的正整数，输出它的位数，逆序输出这个数。文件名为2.java,上传到指定网页。

```java
import java.util.InputMismatchException;
import java.util.Scanner;
public class NumberProcessor {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        long number = 0; // 使用 long 以确保能处理 5 位数及其边界
        try {
            System.out.println("请输入一个不超过 5 位的正整数:");
            // 确保输入是数字
            if (scanner.hasNextLong()) {
                number = scanner.nextLong();
            } else {
                System.out.println("输入无效，请输入一个整数。");
                return;
            }
            // 检查是否是正整数且不超过 5 位
            if (number <= 0) {
                System.out.println("错误：请输入一个正整数。");
                return;
            }
            if (number > 99999) {
                System.out.println("错误：输入的数字超过 5 位。");
                return;
            }
            // 1. 输出位数
            outputDigitsCount(number);
            // 2. 逆序输出这个数
            outputReversedNumber(number);
        } catch (Exception e) {
            System.out.println("程序发生错误：" + e.getMessage());
        } finally {
            scanner.close();
        }
    }
    /**
     * 计算并输出一个正整数的位数。
     */
    private static void outputDigitsCount(long n) {
        // 方法1：转换为字符串，更简洁
        String s = String.valueOf(n);
        int length = s.length();
        // 方法2：数学循环法（备选）
        /*
        int length = 0;
        long temp = n;
        while (temp > 0) {
            temp /= 10;
            length++;
        }
        */
        System.out.println("1. 这个数的位数是: " + length + " 位");
    }
    /**
     * 逆序输出一个正整数。
     */
    private static void outputReversedNumber(long n) {
        long temp = n;
        System.out.print("2. 逆序输出这个数: ");
        if (temp == 0) {
            System.out.println(0);
            return;
        }
        // 使用循环和取模运算
        while (temp > 0) {
            // 获取个位数字
            long digit = temp % 10;
            // 输出该数字
            System.out.print(digit);
            // 去掉个位数字
            temp /= 10;
        }
        System.out.println(); // 换行
    }
}
```

# A卷

### 一、定义一个描述学生信息的类sudent要求如下，

(1)  类Student包含如下成员变量：sNO表示学号；sName表示姓名； sex 表示性别；sAge 表示年龄；sJava表示Java课程成绩。

(2)  类Student包含带参数的构造方法、在构造方法中通过形参完成对成员变量的赋初值操作。

(3)  类Student包含如下方法成员： getNo()获得学号，getName()获得姓名: getsex()获得性别，getAge()获得年龄， getJava()获得Java课程成绩。

(4)  创建Student类的5个对象，输出每个学生的信息，计算并输出这五个学生Java课程成绩的平均值，同时计算并输出5个学生Java课程成绩的最高分和最低分。，

```java
package JavaPracticeExam;

import java.util.List;
import java.util.ArrayList;

public class Student {
	String sNO;
	String sName;
	String sex;
	String sAge;
	int sJava;

	Student(String sNO, String sName, String sex, String sAge, int sJava) {
		this.sNO = sNO;
		this.sName = sName;
		this.sex = sex;
		this.sAge = sAge;
		this.sJava = sJava;
	}
	public String getsNO() {
		return sNO;
	}
	public String getsName() {
		return sName;
	}
	public String getsex() {
		return sex;
	}
	public String getsAge() {
		return sAge;
	}
	public int getsJava() {
		return sJava;
	}
	
	public String toString() {
		return "student [sNO+" + sNO + ",sName=" + sName + ",sex=" + sex + ",sAge=" + sAge + ",sJava=" + sJava + "]";
	}
	public static void main(String[] args) {
		generatestudent();
	}
	public static void generatestudent() {
		List<Student> arrayList = new ArrayList<Student>();
		for (int i = 0; i<5; i++) {
			arrayList.add(new Student("1" + i,"张三 " + i,  "男 ", "2" + i, 75+i));
		}
		int averageScores = 0;
		int tempMax = arrayList.get(0).getsJava();
		int tempLow = arrayList.get(0).getsJava();
		for(int i = 0; i < arrayList.size(); i++) {
			System.out.println(arrayList.get(i).toString());
			averageScores += arrayList.get(i).getsJava();
			if(tempMax > arrayList.get(i).getsJava()) {
				tempLow = arrayList.get(i).getsJava();
			}
			if(tempLow < arrayList.get(i).getsJava()) {
				tempMax = arrayList.get(i).getsJava();
			}
		}
		System.out.println(" 平均分等于： " + averageScores/5);
		System.out.println(" 最高分等于： " + tempMax);
		System.out.println(" 最低分等于： " + tempLow);
	}

}
```

### 二、 是否为素数

从键盘输入一个数， 判断这个数是否是素数，输出true或者false 例如:输入”19"，输出true。 将本题答案文件保存为2.java。

```java
package JavaPracticeExam;

import java.util.Scanner;

public class InputPrimeNumberJugement {

	public static void main(String[] args) {
		System.out.println(getPrimeterNumber());
	}

	private static boolean getPrimeterNumber() {
		System.out.println("请输入：");
		Scanner scanner = new Scanner(System.in);
		int nextInt = scanner.nextInt();
		boolean boo = true;
		if(nextInt < 2) {
			scanner.close();
			return boo = false;
		}
		for(int i = 2; i < nextInt; i++) {
			if(nextInt % i == 0) {
				boo = false;
				break;
			}
		}
		scanner.close();
		return boo;
	}

}
```

### 三、 4位加密

网络传输四位加密数据，加密规则，每位数字都乘以2,然后用乘积除以10的余数代替该数字，再将第一位和第三位交换，第二位和第四位交换。

```java
package JavaPracticeExam;
import java.util.Scanner;

public class Netransofencrydata {
	private static String Netransofencrydata() {
		System.out.println("请输入：");
		Scanner scanner = new Scanner(System.in);
		int nextInt = scanner.nextInt();
		int unit = nextInt % 10;
		int tens = nextInt % 100;
		int hundred = nextInt % 1000;
		int kilobit = nextInt / 1000;

		unit = unit * 2;
		tens = tens * 2;
		hundred = hundred * 2;
		kilobit = kilobit * 2;
	
		unit = unit % 10;
		tens = tens % 10;
		hundred = hundred % 10;
		kilobit = kilobit % 10;

		int temp1 = kilobit;
		kilobit = tens;
		tens = temp1;

		temp1 = hundred;
		hundred = unit;
		unit = temp1;
		scanner.close();
		return kilobit + " " + hundred + " " + tens + " " + unit;
	}
	public static void main(String args[]) {
		System.out.println(Netransofencrydata());
	}
}
```

# B卷

### 一、写一个圆形circle类，面积周长

含有一个protected变量radius，两个构造函数，其中一个是无参数的构造函数，初始化radius为10，第二个为有参数的构造函数，使用传入的参数初始化radius。

(1) 编写该类的Area()方法，用于计算圆的面积。

(2) 编写该类的Circumference()方法，用于计算圆的周长。 

```java
package JavaPracticeExam;

public class Circle{
	protected double radius;
	public Circle() {
	}
	public Circle(double radius) {
		this.radius = radius;
	}
	public double Area() {
		double area;
		area = (this.radius*this.radius)*Math.PI;
		return area;
	}
	public double Circumference() {
		double c;
		c = (this.radius*2)*Math.PI;
		return c;
	}
	public static void main(String args[]) {
		Circle circle = new Circle(10);
		System.out.println("半径为  "+circle.radius+" 的圆,面积是：" + circle.Area());
		System.out.println("半径为  "+circle.radius+" 的圆,周长是：" + circle.Circumference());
	}
}
```

### 二、求阶乘的和：1!+2!+3!+···+10! 相加之和

```java
package JavaPracticeExam;

public class FactorialSum {

	public static void main(String[] args) {
		getFactorial();
	}
	private static void getFactorial() {
		int sum = 0;
		for (int i = 1; i <= 10; i++) {
			int t = 1;
			for (int j = 1; j <= i; j++) {
				t *= j;
			}
			sum += t;
		}
		System.out.println(sum);
	}
}
```

### 三、求 30-80 范围内所有的素数

```java
package JavaPracticeExam;

public class LookPrimeNumber {

	public static void main(String[] args) {

		getPrimeterNumber();
	}
	private static void getPrimeterNumber() {
		int[] pri = new int[80];
		for (int i = 30; i <= 80; i++) {
			boolean boo = true;
			for (int j = 2; j < i; j++) {
				if (i % j == 0) {
					boo = false;
					break;
				}
			}
			if (boo) {
				pri[i] = i;
			}
		}
		for (int i = 0; i < pri.length; i++) {
			if (pri[i] != 0) {
				System.out.print(pri[i]+" ");
			}
		}
	}
}
```

