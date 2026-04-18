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

#### 图

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