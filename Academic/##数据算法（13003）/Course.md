## 绪论

#### 数据结构

```shell
- 数据元素/数据项/数据结构(关系)
- 逻辑结构(集合/线性表/树/图)
- 存储结构(顺序/链式/索引/哈希散列)
```

#### 算法

```shell
# 特性
1.输入 2.输出
3.确定性 4.可行性
5.有限性
```

```shell
# 策略
```

## 线性表

#### 线性表

```shell
###### 定义
- 同类型元素/有序序列
- 表项/表头/表尾/表长/空表/前驱/后驱
# 特点
- 同类型/有限/次序
# 抽象数据类型
- 新建/置空
- 判断/增删改查
```

```shell
###### 顺序表
# 定义
- 连续存储单元>依次存储(数组)
- 数组(最大空间/长度)
- 随机访问(下标>存储地址/O(1))
- 插入/删除(移动>表头表尾/O(n))
# 基本操作
- initList/clear
- isFull/isEmpty/length
- insertList(L,pos,x)
	isFull && 0<pos<=n
	L->ele[i--]=L-ele[i-1]
	L->ele[i]=x
	L->n++
- removeList(L,pos,x)
	isEmpty && 0<pos<n
	*x=L->ele[pos]
	L->ele[i]=L->ele[i+1]
	L->n--
- setValue(L,pos,x)
	0<pos<n
	L->ele[pos]=x
- getValue(L,pos,x)
	0<pos<n
	*x=L->ele[pos]
- Positionfind(L,x)
	L->ele[i]==x
- reverse(L)
	len==0
	swap(&(L->ele[i]),&(L->ele[len-i-1]))
```

```shell
###### 链表(单/双/循环)
# 定义
- 节点(数据域/指针)>不要求相邻
- 插入/删除(位置前移/前后节点)(O(n)O(1))
- 带环(1,2)
# 基本操作
- int initList(LinkList *head)
	(*head)=malloc(sizeof(LinkNode))
	(*head)->next=NULL
	(*head)->data=0
- int clear(LinkList *head)
	while(p=(*head)->next)
	(*head)->next=p->next
	free(p)
	(*head)->data=0
- LinkNode *setCurr(LinkList *head,Position pos)
	while(temp!=NULL&&pos>0)
	temp=temp->next
	pos--
- int insertList(*head,pos,x)
	curr=setCurr(head,pos)
	temp=malloc(sizeof(LinkNode))
	temp->data=x
	temp->next=curr->next
	curr->next=temp
	(*head)->data++
- int removeList(*head,pos,*x)
	curr=setCurr(head,pos)
	*x=curr->next->data
	temp=curr->next
	curr->next=curr->next->next
	free(temp)
	(*head)->data--
- int setValue(*head,pos,x)
	curr=setCurr(head,pos)
	curr->next->data=x
- int getValue(*head,pos,*x)
	curr=setCurr(head,pos)
	*x=curr-next->data
```

```shell
###### 静态链表
```

```shell
###### 比较
- 空间
- 复杂度
###### 应用
```

#### 栈和队列

#### 数组\广义表\串

## 非线性表

#### 树和二叉树

#### 图结构

## 算法

#### 内部排序

#### 查找