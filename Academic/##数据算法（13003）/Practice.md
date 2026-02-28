## 算法设计策略

## 线性表

```shell
L=(a0,a1,a2,a3...an-1)
LOC(ai)=LOC(a0)+i*d
```

```c
// Abstract Data Type
ADT LinearList{
	// Data
    L;
	// Operation
	int initList(LinearList +L);
    int clear(LinearList *L);
    int isEmpty(LinearList *L);
    int isFull(LinearList *L);
    int length(LinearList *L);
    
    int insertList(LinearList *L,Position pos,Ele x);
    int removeList(LinearList *L,Position pos,Ele x);
    int setValue(LinearList *L,Position pos,Ele x);
    int getValue(LinearList *L,Position pos,Ele x);
    Position find(LinearList *L,Ele x);
}
// Operation Demo
initList(&s) => ()
for(i=0;i<6;i++) insertList(&s,i,2*i)
removeList(&s,3,&x)
setValue(&s,3,-10)
find(&s,10) => n
find(&s,9) => -1
```

```c
// SeqList Define
typedef int Ele;
typedef struct{
    Ele element[maxSize]; //保存元素的数组,最大容量maxSize
    int n; //Ele Length
}SeqList
typedef SeqList LinearList;
typedef int Position;
```

```c
// SeqList Operation
int initList(SeqList *L){
    L->n=0;
    return TRUE;
}
int clear(SeqList *L){
	L->n=0;
    return TRUE;
}
int isEmpty(SeqList *L){
	if(L->n==0) return TRUE;
    else return FALSE;
}
int isFull(SeqList *L){
	if(L->n==maxSize) return TRUE;
    else return FALSE;
}
int length(SeqList *L){
    return L->n
}
Position find(SeqList *L,Ele x){
    int i;
    for(i=0;i<L->n;i++)
        if(L->element[i]==x) return i;
    return ERROR;
}
int insertList(SeqList *L,Position pos,Ele x){
    int i;
    if(isFull(L)==TRUE) return FALSE;
    if(pos<0||pos>L->n) return ERROR;
    for(i=L->n;i>pos;i--){
        L->element[i]=L->element[i-1];
    }
    L->element[i]=x;
    L->n++;
    return TRUE;
}
int removeList(SeqList *L,Position pos,Ele *x){
	int i;
    if(isFull(L)==TRUE) return FALSE;
    if(pos<0||pos>L->n) return ERROR;
    *x=L->element[pos];
    for(i=pos;i<L->n-1,i++){
        L->element[i]=L->element[i+1];
    }
    L->n--;
    return TRUE;
}
int setValue(SeqList *L,Position pos,Ele x){
    if(pos>=0&&pos<L->n){
        L->element[pos]=x;
        return TRUE;
    }
    return FALSE;
}
int getValue(SeqList *L,Position pos,Ele *x){
    if(pos>=0&&pos<L->n){
		*x=L->elment[pos];
        return TRUE;
    }
    return FALSE
}
```

```c
// SeqList QUIZ
int main(int argc,char **argv){
    SeqList slist;
    int i,temp;
    if(initList(&slist)==FALSE){
        printf("initial error\n") return 0;
    }else printf("accomplish init\n");
    for(i=0;i<6;i++){
        if(!insertList(&slist),i,2*i) printf("error\n");
    }
    display(&slist);
    if(!removeList(&slist,3,&temp)) printf("error\n");
    else{
        printf("remove: %d\n",temp);
        printf("removed list");
        display(&slist);
    }
    if(!setValue(&slist,4,-10)) printf("error\n");
    else{
        printf("setted list");
        display(&slist);
    }
    if(!getValue(&slist,4,&temp))printf("error\n");
    else printf("getValue: %d\n",temp);
    printf("%d\n",find(&slist,-10));
    printf("%d\n",find(&slist,9));
    return 0;
}
```

```c
// Single linked list
int initList(LinkList *head){
    (*head)=(LinkList)malloc(sizeof(LinkNode));
    if(*head==NULL) return FALSE;
    (*head)->data=0;
    (*head)->next=NULL;
    return TRUE;
}
int clearList(LinkList *head){
	LinkNode *p;
    if(*head==NULL) return FALSE;
    p=(*head)->next;
    while(p!=NULL){
        (*head)->next=p->next;
        free(p);
        p=(*head)->next;
    }
    (*head)->data=0;
    return TRUE;
}
int isEmpty(LinkList *head){
    if(*head==NULL) return ERROR;
    if((*head)->data==0) return TRUE;
    else return FALSE;
}
int length(LinkList *head){
    if(*head==NULL) return ERROR;
    return (*head)->data;
}
int length(LinkList *head){
    LinkNode *p;
    int i=0;
    if(*head==NULL) return ERROR;
    p=(*head)->next;
    while(p!=NULL){
        p=p->next;
        i++;
    }
    return i;
}
LinkNode *setCurr(LinkList *head,Position pos){
    LinkNode *temp=*head;
    if(*head==NULL) return NULL;
    while(temp!=NULL&&pos>0){
        temp=temp->next;
        pos--;
    }
    return temp;
}
int insertList(LinkList *head,Position pos,Ele x){
    LinkNode *temp,*curr;
    if(*head==NULL) return FALSE;
    curr=setCurr(head,pos);
    if(curr==NULL) return FALSE;
    temp=(LinkNode *)malloc(sizeof(LinkNode));
    temp->data=x;
    temp->next=curr->next;
    curr->next=temp;
    (*head)->data++;
    return TRUE;
}
int removeList(LinkList *head,Position pos,Ele *x){
    LinkNode *temp,*curr;
    if(*head==NULL) return FALSE;
    curr=setCurr(head,pos);
    if(curr==NULL||curr->next==NULL) return FALSE;
    if(isEmpty(head)==TRUE) return FALSE;
    *x=curr->next->data;
    temp=curr->next;
    curr->next=curr->next->next;
    free(temp);
    (*head)->data--;
    return TRUE;
}
int setValue(LinkList *head,Position pos,Ele x){
    LinkNode *curr;
    if(*head==NULL) return FALSE;
    curr=setCurr(head,pos);
    if(curr==NULL) return FALSE;
    curr->next->data=x;
    return TRUE;
}
int getValue(LinkList *head,Position pos,Ele *x){
    LinkNode *curr;
    if(*head==NULL) return FALSE;
    curr=setCurr(head,pos);
    if(curr==NULL) return FALSE;
    *x=curr->next->data;
    return TRUE;
}
Position find(LinkList *head,Ele x){
    LinkNode *temp=*head;
    int count=0;
    if(*head==NULL) return ERROR;
    while(temp->next!=NULL){
		if(temp->next->data=x) return count;
        else temp=temp->next; count++;
    }
    return ERROR;
}
```

```c
// Static linked list
typedef int Ele;
typedef struct node{
    Ele data;
    int next;
}ArrayListNode;
typedef struct{
    ArrayListNode element[maxSize];
    int available;
    int unused;
}ArrayList;
typedef int position;
// 查单链表倒数第k个节点
LinkNode *findKth(LinkList *head,int k){
    LinkNode *front,*rear;
    int i,flag=1;
    if(k<=0) return NULL;
	if(*head==NULL) return NULL;
	front=*head;
	rear=*head;
	for(i=0,i<ki++){
		if(front!=NULL) front=front->next;
        else{
			flag=0;
			break;
        }
    }
    if(!flag) return NULL;
	while(front!=NULL){
        front=front->next;
        rear=rear->next;
    }
	return rear;
}
// 查单链表中间节点
- front/near
- 一个两步,一个一步
- 到表尾near
// 单链表逆置
- left/middle/right
- middle.next=left
- 3个指针一次后移一个位置
- 都转向后,head链接表头
```

## 栈和队列

```c
// 顺序栈
typedef int Ele;
typedef struct {
	Ele element [maxSize];
	int top;
}SegStack;
int initStack(SeqStack *mys){
    mys->top=0;
    return TRUE;
}
int clear(SeqStack *mys){
    mys->top=0;
	return TRUE;
}
int isEmpty(SeqStack *mys){
    if(mys->top==0) return TRUE;
    else return FALSE;
}
int isFull(SeqStack *mys){
    if(mys->top==maxSize) return TRUE;
    else return FALSE;
}
int push(SeqStack *mys,ELEMType x){
	if(isFull(mys)-=FALSE){
        mys->element[mys->top++]=x;
    }else{
		return FALSE;
    }
	return TRUE;
}
int pop(SeqStack *mys,ELEMType *x){
  if(isEmpty(mys)==FALSE){
	*x=mys->element[--mys->top];
    return TRUE;
  }
  else{
  	return FALSE;
  }
}
int gettop(SeqStack *mys, Ele *x){
	if(isEmpty(mys)-=FALSE){
        *x=mys->element[mys->top-1];
        return TRUE;
    }
	else{
		return FALSE; 
    }
}
```

```c
// 链式栈
typedef int ELEMType;
typedef struct node{
	ELEMType data;
	struct node *next;
}LinkStackNode;
typedef LinkStackNode *LinkStack;

int initStack(LinkStack *mys){
	*mys=NULL
    return TRUE;
}
int push(LinkStack *mys,ELEMType x){
    LinkStackNode *p;
    p=(LinkStackNode*)
        malloc(sizeof(LinkStackNode));
    if(p!=NULL){
		p->data=x;
		p->next=(*mys);
        (*mys)p;  
    }
    else{
        return FALSE;
    }
	return TRUE;
}
```

```c
// 循环队列
typedef int ELEMType;
typedef struct{
	ELEMType element [maxSize];
    int front,rear;
}SeqQueue;
```

```c
int clear(SeqQueue *myq){
    myq->front=myq->rear;
    return TRUE;
}
int isEmpty(SeqQueue *myq){
    if(myq->front==myq->rear) return TRUE;
    else return FALSE;
}
int isFull(SeqQueue *myq){
	if((myq->rear+1)%maxSize==myq->front) return TRUE;
    else return FALSE:   
}
int length(SeqQueue *myq){
	return (myq->rear-myq->front+maxSize)%maxSize;
}

int enqueue(SeqQueue *myq, ELEMType x){
    if(isFull(myq)==TRUE) return FALSE;
    myq->element[(myq->rear++)%maxSize]=x;
    return TRUE;
}
int dequeue(SeqQueue *myq,ELEMType *x){
	if(isEmpty(myq)==TRUE) return FALSE;
    *x=myq->element[(myq->front++)%maxSize];
    return TRUE;   
}
```

```c
// 链式队列
typedef int ELEMType;
typedef struct node{
	ELEMType data;
	struct node *next;
}LinkQueueNode;
typedef struct{
	LinkQueueNode *front, *rear;    
}LinkQueue;
int isEmpty(LinkQueue *myq){
	if((*myq).front=NULL &&(*myq).rear==NULL)
        return TRUE;
    else return FALSE;
}
int enqueue(LinkQueue *myq, ELEMType x){
    LinkQueueNode *temp;
    temp=(LinkQueueNode *)malloc(sizeof(LinkQueueNode));
    if(temp=-NULL) return FALSE;
    temp->data-x;
    temp->next=NULL;
    if((*myq).front-=NULL){
        (*myq).front=temp;
        (*myq).rear=temp;
    }
    else{
    	(*myq).rear->next=temp;
    	(*myq).rear=temp;
    }
    return TRUE;  
}

int dequeue(LinkQueue*myq,ELEMType* x){
	LinkQueueNode *temp;
    if(isEmpty(myq)==TRUE)	return FALSE;
	*x=(*myq).front->data;
    temp=(*myq).front;
    (*myq).front-temp->next;
    if((*myq).front==NULL)	(*myq).rear=NULL;
	free(temp);
    return TRUE;    
}
```

```c
// 使用栈来模拟队列
typedef struct{
	SegStack S, T;
}simuQueue;
typedef int ELEMType;

int initsimuQ(simuQueue *simuq){
    initStack(&simuq->S);
    initStack(&simuq->T);
    return TRUE;
}

int dequeuesimuQ(simuQueue *simuq, ELEMType *x){
	ELEMType temp;
    if(isEmply(&simuq->T)==FALSE){
        pop(&simuq->T,x);retumn TRUE;
    }
	if(isEmpty(&simuq->S)==TRUE)	retumn FALSE;
	while(isEmpty(&simuq->S)==FALSE && isFull(&simuq->T)==FALSE{
    	pop(&simuq->S,&temp);
	    push(&simuq->T,temp);
    }	
	pop(&simuq->T,x);return TRUE;
}
int isEmptysimuQ(simuQueue *simuq){
	if(isEmpty(&simuq->S) && isEmpty(&simuq->T)) return TRUE;
    else return FALSE;
}
int isFullsimuQ(simuQueue *simuq){
	if(isFull(&simuq->S) && lisEmpty(&simuq->T)) return TRUE;
    else return FALSE;	
}


```

```c
// 使用队列模拟的栈类型
typedef struct{
	SeqQueue P, Q;
}simuStack;
typedef int ELEMType;

int initsimuS(simuStack *simus){
    initQueue(&simus->P);
    initQueue(&simus->Q);
    return TRUE;
}

int clearsimuS(simuStack *simus){
    clear(&simus->P);
    clear(&simus->Q);
    return TRUE;
}
int isEmptysimuS(simuStack *simus){
	if(isEmpty(&simus->P)==TRUE 
       && isEmpty(&simus->Q)==TRUE) 
        return TRUE;
    else return FALSE;
}
int isFullsimuS(simuStack *simus){
    if(isFull(&simus->P)==TRUE) return TRUE;
    else return FALSE;
}
int lengthsimuS(simuStack *simus){
	int lengthl;
    lengthl=(simus->P.rear-simus->P.front+maxSize)%maxSize;
    return lengthl;
}
int pushsimuS(simuStack *simus, ELEMType x){
	if(isFull(&simus->P)==FALSE)
        enqueue(&simus->P,x);
        return TRUE;
	return FALSE;	
}
```

```c
// 表达式的计算
// 获取运算符优先级
int oper[]={'+'};
int innerpri[]=(3,3,5,5,5,1,-1,0);
int outpri= {2,2,4,4,4,8,1,-1);
int innerpriv(char c){
	int i;
    for (i=0;i<8;i+)
        if(c==oper[i) 
        return innerpri[i];
	return -2;
}
int outpriv(char c){
	int i;
    for (i=0;i<8;i++)
		if(c-oper[i) return outpri[i]:
	return -2;   
}
```

## 数组广义表和串

```c
Create();
Store(index,value);
Retrieve(index);
// 多维数组
int DkArray[u1][u2]...[uk];
n=u1*u2...*uk;
sizeof(DkArray)=n*sizeof(int);
start+sizeof(DkArray)-1;

map(i1,i2)=i1*u2+i2;
map(i1,i2)=i2*u1+i1;
map(i1,i2,i3)=i1*u2*u3+i2*u3+i3;
```



## 树与二叉树

## 图结构

## 内部排序

## 查找