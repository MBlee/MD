```shell
### 时间复杂度 
Ω(f(n))<=T(n)<=O(f(n))
Θ(f(n))=Ω(f(n))=O(f(n))
- O(1)/O(n)/O(logn)
- O(n²)/O(2n)
```

## 数据结构

#### 线性结构

#### 栈和队列

#### 数组/广义表/串

#### 树

```c++
// BinaryGenerate
void array2Tr(BNode *root,int a[],int p){
  BNode *temp;
  if(r==NULL) return;
  if(2p<a.len()&&a[2p]!=NULL){
    temp=(BNode*)malloc(sizeof(BNode));
    temp->data=a[2p];
    temp->left=NULL;temp->right=NULL;
    root->left=temp;
    array2Tr(root->left,a,2p);
  }
  if(2p+1<a.len()&&a[2p+1]!=NULL){
    temp=(BNode*)malloc(sizeof(BNode));
    temp->data=a[2p+1];
    temp->left=NULL;temp->right=NULL;
    root->right=temp;
    array2Tr(root->right,a,2p+1);
  }
}
// Traverse-Recursion
void preTra(BTree root){
  if(root==NULL) return;
  cout<<root.data<<endl;
  preTra(root->l);
  preTra(root->r);
}
int leafAm(BTree root){
  if(root==NULL) return 0;
  if(root->l==NULL&&root->r==NULL) return 1;
  return leafAm(root->l)+leafAm(root->r);
}
int hight(BTree root){
  if(root==NULL) return 0;
  return max(hight(root.l),hight(root.r))+1;
}
// Traverse-Level
void levelTra(BTree root){
  BNode temp;
  Queue q;
  if(root==NULL) return;
  init(&q);
  enque(&q,root);
  while(isEmp(&q)==FALSE){
    deque(&q,temp);
    cout<<temp.data<<endl;
    if(temp.l!=NULL) enque(&q,temp.l);
    if(temp.r!=NULL) enque(&q,temp.r);
  }
}
// Traverse-NonRecursion

// Apply
```

```c++
// HeapGenerate
// PrecedenceQueue
```

```c++
// TreeGenerate
// TreeForestTransform
// Traverse
```

```c++
// HuffmanTree
// HuffmanCode
```

#### 图

```c++
// GraphGenerate
```

## 排序算法

#### 直接插入

```c
// 直接插入排序
1.Fronts++/Near++
2.Swap(near,front)/front+=front
int insertSort(myRcd *myarr){
	int i,j,temp;
    for(i=1;i<myarr->length;i++){
    	j=i;
        if(myarr->data[j]<myarr->data[j-1]){
        	temp=myarr->data[j];
        	while(myarr->data[j]<myarr->data[j-1]&&j>0){
        		myarr->data[j]=myarr->data[--j];
        	}
        	myarr->data[++j]=temp;
        }
    }
    return TRUE;
}
```

```shell
# 希尔排序
```

## 查找算法