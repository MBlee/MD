## Essential

```go
package main
import "fmt"
func main(){
  fmt.Printf("%T%v%d%.2f%s")
}
var a,b,c int...
var const
(
  a int/uint float32/64
  b string = ""
  c bool = false
)
```

#### DataType

```go
//🚗Mul
arr:=[len|...]int{1:10,2:20}
len(arr)
slice:=[]int{}
slice:=make([]int,len,cap)
slice:=arr[sta:end]
append(slice,el,...)
append(slice,slice1...)
copy(dest,src)
mapp:=map[kType]vType{key:val,...}
mapp:=make(map[kType]vType)
delete(mapp,key)
_,isExist=mapp[key]
len(slice)
cap(slice)
type stru struct{ name string }
//🚗Flow
if a>b {}else{}
switch con {case x,y: default:}
for s1;s2;s3{}
for _,v := range arr/slice/map{}
func fn(p int,...)(res1 int,res2 int){}
```

