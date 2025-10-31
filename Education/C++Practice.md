#### 对象之和（友元运算符）

定义一个类,名字叫Test。有一个整型私有成员Math. 构造函数初始化Math；定义友元运算符重载函数Display,返回两个对象的Math之和。在主函数里初始化两个Test对象。第一个是用构造函数初始化Math为85. 第二个用构造函数立即设定Math为73. 然后用友元运算符重载函数输出两个对象的Math之和。设定析构函数输出Dest.

```c++
#include <iostream>
// 前置声明：声明 Test 类，以便友元函数可以引用它
class Test; 
/**
 * @brief 友元运算符重载函数：计算两个 Test 对象的 Math 成员之和。
 * * @param t1 第一个 Test 对象
 * @param t2 第二个 Test 对象
 * @return 两个对象的 Math 成员之和
 */
int operator+(const Test& t1, const Test& t2);
/**
 * @brief Test 类，用于演示构造函数、析构函数和友元运算符重载。
 */
class Test {
private:
    int Math; // 整型私有成员变量
public:
    /**
     * @brief 构造函数：初始化 Math 成员变量。
     * @param m 用于初始化 Math 的值
     */
    Test(int m) : Math(m) {
        std::cout << "Test 对象已创建，Math 初始化为: " << Math << std::endl;
    }
    /**
     * @brief 析构函数：对象被销毁时调用，输出 "Dest"。
     */
    ~Test() {
        std::cout << "Dest (Math=" << Math << ")" << std::endl;
    }
    // 声明友元运算符重载函数
    friend int operator+(const Test& t1, const Test& t2);
};
// 友元运算符重载函数定义
int operator+(const Test& t1, const Test& t2) {
    // 作为友元函数，它可以直接访问 Test 类的私有成员 Math
    return t1.Math + t2.Math;
}
// 主程序
int main() {
    // 1. 初始化第一个 Test 对象，Math 为 85
    std::cout << "--- 实例化对象 T1 ---" << std::endl;
    Test t1(85);
    // 2. 初始化第二个 Test 对象，Math 为 73
    std::cout << "--- 实例化对象 T2 ---" << std::endl;
    Test t2(73);
    // 3. 使用友元运算符重载函数计算并输出 Math 之和
    std::cout << "\n--- 计算两个对象的 Math 之和 ---" << std::endl;
    int sum = t1 + t2; // 调用重载的 operator+ 函数
    std::cout << "T1.Math (" << t1.Math << ") + T2.Math (" << t2.Math << ") = " << sum << std::endl;
    std::cout << "\n--- 程序结束，调用析构函数 ---" << std::endl;
    // t1 和 t2 对象在 main 函数结束时会被自动销毁
    return 0;
}
```

#### 学生类（平均分/标记优秀）

对学生进行管理，定义了学生类，该类定义了成员变量：姓名、学号、语文分，数学分，外语分。题目计算了每个同学的平均分，对于外语成绩在85分以上的同学，标记为“外语优秀”。

```c++
#include <iostream>
#include <string>
#include <iomanip> // 用于格式化输出
/**
 * @brief 学生类，包含学生的基本信息、成绩和计算功能。
 */
class Student {
private:
    std::string name;       // 姓名
    std::string studentId;  // 学号
    double chineseScore;    // 语文分
    double mathScore;       // 数学分
    double foreignScore;    // 外语分
    double averageScore;    // 平均分
    std::string foreignStatus; // 外语优秀标记
    /**
     * @brief 内部函数，计算平均分并设置外语优秀标记。
     */
    void calculateAndSetStatus() {
        // 计算平均分
        averageScore = (chineseScore + mathScore + foreignScore) / 3.0;
        // 判断外语成绩是否优秀（85分以上）
        if (foreignScore >= 85.0) {
            foreignStatus = "外语优秀";
        } else {
            foreignStatus = "普通";
        }
    }
public:
    /**
     * @brief 构造函数，初始化所有成员变量并执行计算。
     */
    Student(std::string n, std::string id, double ch, double ma, double fo) 
        : name(n), studentId(id), chineseScore(ch), mathScore(ma), foreignScore(fo) {
        // 确保分数在合理范围内（例如 0-100）
        if (ch < 0 || ma < 0 || fo < 0 || ch > 100 || ma > 100 || fo > 100) {
            std::cerr << "警告: " << name << " 的成绩有不合理值，请检查。" << std::endl;
        }
        // 构造时立即计算并设置状态
        calculateAndSetStatus();
    }
    /**
     * @brief 打印学生所有信息，包括计算结果。
     */
    void printInfo() const {
        std::cout << std::left << std::setw(10) << name
                  << std::setw(15) << studentId
                  << std::setw(8) << chineseScore
                  << std::setw(8) << mathScore
                  << std::setw(8) << foreignScore
                  // 输出平均分，保留两位小数
                  << std::fixed << std::setprecision(2) << std::setw(10) << averageScore
                  << std::setw(12) << foreignStatus
                  << std::endl;
    }
};
// 主程序
int main() {
    // 设置输出格式
    std::cout << std::left;
    std::cout << "----------------------------------------------------------------" << std::endl;
    std::cout << std::setw(10) << "姓名" 
              << std::setw(15) << "学号" 
              << std::setw(8) << "语文" 
              << std::setw(8) << "数学" 
              << std::setw(8) << "外语" 
              << std::setw(10) << "平均分" 
              << std::setw(12) << "外语状态" 
              << std::endl;
    std::cout << "----------------------------------------------------------------" << std::endl;
    // 实例化学生对象
    // (姓名, 学号, 语文, 数学, 外语)
    Student s1("张三", "2023001", 85.5, 90.0, 92.0); // 外语优秀
    Student s2("李四", "2023002", 78.0, 88.5, 80.0); // 外语普通
    Student s3("王五", "2023003", 95.0, 95.0, 85.0); // 外语优秀
    Student s4("赵六", "2023004", 60.0, 70.0, 84.9); // 外语普通
    // 输出学生信息
    s1.printInfo();
    s2.printInfo();
    s3.printInfo();
    s4.printInfo();
    std::cout << "----------------------------------------------------------------" << std::endl;
    return 0;
}
```

#### 两个整数是否包含

```c++
#include <iostream>
#include <string>
#include <algorithm> // 包含 std::to_string
/**
 * @brief 检查整数 n 的数字序列中是否包含整数 d 的数字序列。
 * * @param n 被检查的大整数。
 * @param d 要查找的子整数。
 * @return 如果 n 包含 d 则返回 true，否则返回 false。
 */
bool check(int n, int d) {
    // 1. 将 n 和 d 转换为 std::string
    std::string str_n = std::to_string(n);
    std::string str_d = std::to_string(d);
    // 2. 使用 std::string 的 find() 方法进行查找。
    //    如果 find() 找到子串，它返回起始位置的索引；
    //    如果找不到，它返回 std::string::npos。
    
    // 返回查找结果是否不是 std::string::npos
    return str_n.find(str_d) != std::string::npos;
}
// 主函数用于测试
int main() {
    // 示例 1: 37568 包含 3 (true)
    std::cout << "check(37568, 3) = " 
              << std::boolalpha << check(37568, 3) << std::endl;     
    // 示例 2: 45635 不包含 1 (false)
    std::cout << "check(45635, 1) = " 
              << std::boolalpha << check(45635, 1) << std::endl;  
    // 示例 3: 12345 包含 23 (true)
    std::cout << "check(12345, 23) = " 
              << std::boolalpha << check(12345, 23) << std::endl;
    // 示例 4: 12345 不包含 54 (false)
    std::cout << "check(12345, 54) = " 
              << std::boolalpha << check(12345, 54) << std::endl;
    // 示例 5: 包含 0
    std::cout << "check(1024, 0) = " 
              << std::boolalpha << check(1024, 0) << std::endl; // true
    // 示例 6: n, d 相等
    std::cout << "check(88, 88) = " 
              << std::boolalpha << check(88, 88) << std::endl; // true
    return 0;
}
```

#### 分数类（加减/倒数）

1.定义一个类Fraction，其有2个私有成员变量，分别表示分子和分母。
①定义一个有参构造函数，分别给分子分母赋值。
②定义友元运算符重载函数，实现分数的加减
③定义析构函数，对象被释放时输出“over”
④定义成员函数，输出分数的倒数，分数的分子和分母。
⑤声明两个对象f1和f2,f1的分子分母为8/5，f2的分子分母为3/7，计算f1和f2的和与差，输出f1的倒数。

```c++
#include <iostream>
#include <numeric> // C++17 标准库函数，用于 std::gcd
#include <cmath>   // 用于 std::abs
/**
 * @brief 表示分数的类。
 */
class Fraction {
private:
    int numerator;   // 分子
    int denominator; // 分母
    /**
     * @brief 辅助函数：将分数约分到最简形式，并确保分母为正。
     */
    void simplify() {
        if (denominator == 0) {
            std::cerr << "错误：分母不能为零！已将分子分母置为 0/1。" << std::endl;
            numerator = 0;
            denominator = 1;
            return;
        }
        // 确保负号只在分子上，分母永远为正
        if (denominator < 0) {
            numerator = -numerator;
            denominator = -denominator;
        }
        // 使用 std::gcd (最大公约数) 进行约分
        // C++17 或更高版本支持 std::gcd。如果编译器不支持，需要手动实现 GCD 函数。
        int common = std::gcd(std::abs(numerator), denominator); 
        numerator /= common;
        denominator /= common;
    }
public:
    // ① 有参构造函数
    Fraction(int num = 0, int den = 1) : numerator(num), denominator(den) {
        // 构造时进行约分，保证内部数据始终是最简形式
        simplify();
    }
    // ③ 析构函数
    ~Fraction() {
        std::cout << "over" << std::endl;
    }
    // ④ 成员函数：输出分数的倒数
    void print_reciprocal() const {
        if (numerator == 0) {
            std::cout << "倒数：不存在 (分子为 0)" << std::endl;
        } else {
            // 倒数为 (分母 / 分子)
            // 无需再次约分，因为原分数已是最简
            std::cout << "倒数：" << denominator << "/" << numerator;
        }
    }
    // ④ 成员函数：输出分数本身
    void print() const {
        std::cout << numerator << "/" << denominator;
    }
    // ② 友元运算符重载函数声明 (加法和减法)
    friend Fraction operator+(const Fraction& f1, const Fraction& f2);
    friend Fraction operator-(const Fraction& f1, const Fraction& f2);
};
// ② 友元运算符重载函数实现：加法
Fraction operator+(const Fraction& f1, const Fraction& f2) {
    // 结果分子 = f1.num * f2.den + f2.num * f1.den (通分)
    int new_num = f1.numerator * f2.denominator + f2.numerator * f1.denominator;
    // 结果分母 = f1.den * f2.den
    int new_den = f1.denominator * f2.denominator;
    
    // 返回新的 Fraction 对象，构造函数会负责约分
    return Fraction(new_num, new_den);
}
// ② 友元运算符重载函数实现：减法
Fraction operator-(const Fraction& f1, const Fraction& f2) {
    // 结果分子 = f1.num * f2.den - f2.num * f1.den (通分)
    int new_num = f1.numerator * f2.denominator - f2.numerator * f1.denominator;
    // 结果分母 = f1.den * f2.den
    int new_den = f1.denominator * f2.denominator;
    return Fraction(new_num, new_den);
}
// ⑤ 主函数：声明对象并进行计算
int main() {
    std::cout << "--- 分数对象实例化 ---" << std::endl;
    // ⑤ 声明两个对象f1和f2
    Fraction f1(8, 5); // f1 = 8/5
    Fraction f2(3, 7); // f2 = 3/7
    std::cout << "F1 = "; f1.print(); std::cout << std::endl;
    std::cout << "F2 = "; f2.print(); std::cout << std::endl;
    // ----------------------------------------------------
    // 计算和与差
    // ----------------------------------------------------
    // 和：8/5 + 3/7 = (56 + 15) / 35 = 71/35
    Fraction sum = f1 + f2;
    // 差：8/5 - 3/7 = (56 - 15) / 35 = 41/35
    Fraction diff = f1 - f2;
    std::cout << "\n--- 运算结果 ---" << std::endl;
    // 输出 f1 和 f2 的和
    std::cout << "F1 + F2 = ";
    sum.print();
    std::cout << std::endl;
    // 输出 f1 和 f2 的差
    std::cout << "F1 - F2 = ";
    diff.print();
    std::cout << std::endl;
    // 输出 f1 的倒数
    std::cout << "\nF1 ";
    f1.print_reciprocal(); 
    std::cout << std::endl;
    std::cout << "\n--- 程序结束，调用析构函数 ---" << std::endl;
    return 0; // f1, f2, sum, diff 在这里被销毁
}
```

#### 输入字符串替换

编写一个函数用，输入两行字符串。第一行输入一个字符串，例如：I love China, 第二行输入例：I U。IU中间用空格隔开。把第一个字符串里出现的I用U替换。最终输出 U love China;注意： I U非固定。 

```c++
#include <iostream>
#include <string>
#include <sstream>
/**
 * @brief 读取两行输入，并根据第二行指定的字符执行替换操作。
 */
void replace_characters_in_string() {
    std::string original_str;
    std::string char_line;
    char char_to_find, char_to_replace_with;
    // --- 1. 读取第一行字符串 (I love China) ---
    std::cout << "请输入第一行字符串 (包含空格):" << std::endl;
    // 使用 std::getline 读取包含空格的整行
    std::getline(std::cin, original_str);
    // --- 2. 读取第二行替换字符 (I U) ---
    std::cout << "请输入第二行替换字符 (例如: I U，中间用空格隔开):" << std::endl;
    std::getline(std::cin, char_line);
    // 使用 stringstream 从第二行中解析出两个字符
    std::stringstream ss(char_line);
    // 检查是否成功提取两个字符
    if (!(ss >> char_to_find >> char_to_replace_with)) {
        std::cerr << "错误：第二行输入格式不正确，请确保输入了两个以空格分隔的字符。" << std::endl;
        return;
    }
    // --- 3. 执行替换操作 ---
    // 遍历字符串的每一个字符 (使用引用 &c 来直接修改原字符串)
    for (char& c : original_str) {
        if (c == char_to_find) {
            c = char_to_replace_with;
        }
    }
    // --- 4. 输出最终结果 ---
    std::cout << "\n--- 替换结果 ---" << std::endl;
    std::cout << original_str << std::endl;
}

int main() {
    // 调用函数执行任务
    replace_characters_in_string();
    return 0;
}
```

#### 等腰三角形（是否是/周长）

编写程序t3.cpp，要求：
（1）定义等腰三角形的类Sanjiao，其三个边长为bianA、bianB、bianC为其私有成员变量。请定义至少三个函数，构造函数（把最长边存储到BianC中），判断是否为等腰三角形的成员函数isDYSanjiao，求等腰三角形周长的成员函数（如是等腰三角形返回周长，否则返回-1）。
（2）主程序调用刚刚定义的等腰三角形类，能够输出当前对象是否为等腰三角形，并输出其周长值。

```c++
#include <iostream>
#include <algorithm>
#include <cmath>
#include <vector>
/**
 * @brief 表示三角形的类，包含等腰三角形的判断和周长计算功能。
 */
class Sanjiao {
private:
    double bianA; // 边 A
    double bianB; // 边 B
    double bianC; // 边 C (存储最长边)
public:
    /**
     * @brief 构造函数。初始化三条边，并确保最长边存储在 bianC 中。
     * @param a 第一条边长
     * @param b 第二条边长
     * @param c 第三条边长
     */
    Sanjiao(double a, double b, double c) {
        // 1. 检查能否构成三角形（任意两边之和大于第三边）
        if (a <= 0 || b <= 0 || c <= 0 || a + b <= c || a + c <= b || b + c <= a) {
            std::cerr << "错误：输入的三条边无法构成一个有效的三角形，或边长非正值。" << std::endl;
            // 为了避免后续计算错误，将所有边长置为 0
            bianA = bianB = bianC = 0.0;
            return;
        }
        // 2. 将三条边放入数组进行排序
        std::vector<double> sides = {a, b, c};
        std::sort(sides.begin(), sides.end());
        // 3. 将最长边存储到 bianC，其余两边存储到 bianA 和 bianB
        bianA = sides[0];
        bianB = sides[1];
        bianC = sides[2];
        // 额外的判断：由于 bianA 和 bianB 可能是等腰三角形的相等边
        // 或者 bianB 和 bianC 可能是等腰三角形的相等边，但我们已将最长边固定为 bianC
        // 因此，等腰情况是 bianA == bianB 或 bianB == bianC。
    }
    /**
     * @brief 判断当前对象是否为等腰三角形。
     * 等腰三角形定义：至少有两条边相等。
     * @return 如果是等腰三角形返回 true，否则返回 false。
     */
    bool isDYSanjiao() const {
        // 由于构造函数已经保证 bianC 是最长边 (最大值)
        // 只需要比较 bianA 和 bianB，或者 bianB 和 bianC。
        // 使用一个小的容差 (epsilon) 来处理浮点数比较的精度问题
        const double EPSILON = 1e-9; 
        // 检查是否有任意两边相等
        if (std::abs(bianA - bianB) < EPSILON || 
            std::abs(bianB - bianC) < EPSILON) {
            return true;
        }
        return false;
    }
    /**
     * @brief 求三角形的周长。如果不是等腰三角形，返回 -1。
     * @return 如果是等腰三角形返回周长，否则返回 -1。
     */
    double calculatePerimeter() const {
        // 首先检查是否为等腰三角形
        if (isDYSanjiao()) {
            // 周长 = 三边之和
            // 需要先检查是否是有效的三角形 (构造函数已处理，但为了严谨性)
            if (bianA > 0 && bianB > 0 && bianC > 0) {
                return bianA + bianB + bianC;
            }
        }
        // 如果不是等腰三角形，或者不是有效的三角形
        return -1.0;
    }
    /**
     * @brief 辅助函数：输出三边信息（可选）。
     */
    void printSides() const {
        std::cout << "三边长为: A=" << bianA << ", B=" << bianB << ", C(最长边)=" << bianC;
    }
};
// 主程序
int main() {
    // ----------------------------------------------------
    // 1. 等腰三角形测试 (5, 5, 8)
    // ----------------------------------------------------
    Sanjiao t1(5.0, 8.0, 5.0);
    std::cout << "--- 测试对象 t1 (5, 8, 5) ---" << std::endl;
    t1.printSides();
    std::cout << std::endl;
    if (t1.isDYSanjiao()) {
        std::cout << "当前对象 t1 是等腰三角形。" << std::endl;
        double perimeter = t1.calculatePerimeter();
        std::cout << "周长值: " << perimeter << std::endl; // 预期: 18.0
    } else {
        std::cout << "当前对象 t1 不是等腰三角形。" << std::endl;
        std::cout << "周长值: " << t1.calculatePerimeter() << std::endl; // 预期: -1.0
    }
    std::cout << "\n------------------------------------" << std::endl;
    // ----------------------------------------------------
    // 2. 非等腰三角形测试 (3, 4, 5)
    // ----------------------------------------------------
    Sanjiao t2(3.0, 4.0, 5.0);
    std::cout << "--- 测试对象 t2 (3, 4, 5) ---" << std::endl;
    t2.printSides();
    std::cout << std::endl;
    if (t2.isDYSanjiao()) {
        std::cout << "当前对象 t2 是等腰三角形。" << std::endl;
        std::cout << "周长值: " << t2.calculatePerimeter() << std::endl; 
    } else {
        std::cout << "当前对象 t2 不是等腰三角形。" << std::endl;
        std::cout << "周长值: " << t2.calculatePerimeter() << std::endl; // 预期: -1.0
    }
    std::cout << "\n------------------------------------" << std::endl;
    // ----------------------------------------------------
    // 3. 非法输入测试 (2, 3, 10)
    // ----------------------------------------------------
    Sanjiao t3(2.0, 3.0, 10.0);
    std::cout << "--- 测试对象 t3 (2, 3, 10) ---" << std::endl;
    // t3.printSides(); // 由于构造函数会报错，这里不再打印
    if (t3.calculatePerimeter() == -1.0) {
        std::cout << "对象 t3 为无效三角形，周长返回 -1.0。" << std::endl;
    }
    return 0;
}
```

