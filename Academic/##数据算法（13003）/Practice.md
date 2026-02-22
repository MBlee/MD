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



## 栈和队列

## 数组广义表和串

## 树与二叉树

## 图结构

## 内部排序

## 查找