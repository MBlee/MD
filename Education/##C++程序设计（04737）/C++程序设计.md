```c++
#include <cstdlib>
- atof(str.c_str())
#include <string>
- str.find("+",0)
- str.substr(pos,length-1)
```

## 第一章 C++语言简介

```c++
#include <iostream><fsstream><string><cmath>
#include "c:\path\file.h"
using namespace std;
using std::cin;
cin>>a>>c
cout<<exp1<<"\n"<<exp2<<endl
const double d=1.0
double d=0
double& d=a
double* d=&a=new int[n]
inline void fun(int&,int=n)
str.c_str
str.substr
```

## 第二/三章 类和对象

```c++
const class cls()
void func() const // cls.func()
cls::cls(A& a,B& b):a(a),b(b){}
cls::cls(cls&):c(cls){}
cls::cls(A& a):b(a){}
~cls::cls(){}
friend class cls; 
friend void func();
```

## 第四章 运算符重载

```c++
C operator-(C &c)
friend C operator-(C& c1,C& c2)
C& operator=(C& c1){
	if(this==&c1)return *this
    delete this->p
	this->p=new int(*c1.p)
    return *this  
}
C& C::operator++(){
	n++
    return *this
}
C C::operator++(int k){
	C temp(*this)
    n++
    return temp
}
ostream &operator<<(ostream& os,const C& c){
	os<<c.xx
	return os
}
istream &operator>>(istream& is,C& c){
    is>>c
	return is
}
operator double(){
  return real
}
```

```c++
// 深复制
C(const C& temp){
  if(this!=&temp){
    c=new int(*temp.p)
  }
}
```

## 第五/六章 类继承与多态

```c++
class A: public B,...{ friend B::func }
A a=B b()
class A: virtual private/protected B
C::C(): B(...),...{}
```

```c++
virtual void func(){}
virtual ~C(); 
virtual void func()=0
```

## 第七/八章 输入输出流/文件

```c++
ios>>istream|ostream>>iostream>>fstream
istream>>ifstream
ostream>>ofstream
iomanip
```

```c++
freopen("input.dat","r",stdin)
freopen("test.txt","w",stdout)
cin.eof()
```

```c++
#include <fstream> (ifstream/ofstream/fstream)
ifstream ifs;
ifs.open('file',ios::in|ios::out|ios::binary);
ifstream ifs('file',mode);
ifs.close()
```

## 第九章 类函数模板

```c++
template <int a,...>
void temFunc(int a){}
```

