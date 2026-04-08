## Essential

```c
#include <stdio.h>
int main(){
  printf("%d%zu %.1lf%c% %p");
  scanf("%d %s",&number,str);
  fgets(str,sizeof(str),stdin);
  return 0;
}
```

#### 常量和变量

```shell
# 整型常量
- 1，01，0x1
# 实型常量
- 1.1, 0.1e9, 0.1e-9
# 字符常量
- 'a','\n',33
# 字符串常量
- "abc"
# 地址常量
# 符号常量：#define c 10
```

```c
// Pointer
int* p = &p;
p=0x000;
*p=10;
arr=&arr[0];
*arr=arr[0];
*(arr+1)=arr[1];
**pstr=&*p;
// Basic
const int A=10;
int i = (int)1.1; 
int i[2][3][4]={{},...};
char c[]="chars";
char c[]={'\0'}
#include <stdbool.h>
bool b=true;
// String
#include <string.h>
int len = sizeof(str)/sizeof(str[0]);
strlen(str);
strcpy(strTo,strFrom);
strcat(strTo,strFrom);
strcmp(str1,str2);
```

```c
// Struct(union)
struct St{};
typedef struct{}St;
struct St s={};
St s={};
struct St* s=(struct St*)malloc(sizeof(struct St)*n);
St* s=(St*)malloc(sizeof(St)*n);
```

```c
// Fn
#include <math.h>
inline void fn(int i,char c,void (*cb)(...));
void (*fns[])(...);
```

#### 内存分配

```c
// Allocate
int* i=malloc(sizeof(i)*n);
char* c=calloc(n,sizeof(c));
char* c1=realloc(c,sizeof(c)*n);
c1==NULL && free(c);
c1!=NULL && c=c1;
// DeAllocate
free(p);
p=NULL;
// Operator
*i=i[0]=10;
```

#### Error

```c
// NULL
#inlcude <errno.h>
strerror(errno);
perror("err");
exit(1);
```

