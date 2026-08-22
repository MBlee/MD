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
  nil
)
```

#### DataType

```go
//🚗Mul
p:=new(11)
p *int => &p
arr:=[len|...]int{1:10,2:20}
slice:=[]int{}
slice:=make([]int,len,cap)
slice:=arr[st:end]
append(slice,el,...)
append(slice,slice1...)
copy(dest,src)
m:=map[kType]vType{key:val,...}
m:=make(map[kType]vType)
delete(m,key)
clear(m)
_,isExist=mapp[key]
len(slice/arr)
cap(slice)
type stru struct{ name string }
&stru{,}|stru{name:,}
//🚗Flow
if{}else{}
switch {case x,y<0: default:}
for ;;{}
for _,v := range arr/slice/map/num{}
func fn(p ...int)(res1 int,res2 int){} => fn(sli...)
func fn() func()int{}
//🚗Type
x.(type)
```

```go
//🚗Slices
slices.equal(s1,s2)
//🚗Maps
maps.equal(m1,m2)
```

