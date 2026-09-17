## Essential

```go
package main
import (
	f "fmt"
)
func main(){
  fmt.Printf("%T%v%d%.2f%s")
  fmt.Sprintf()
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
//🚗Math/rand
rand.Intn(n)
//🚗Regexp
regexp.MustCompile(``)
re.MatchString(str)
```

```go
//🚗Errors
errors.New(str)
//🚗Log
log.SetPrefix(str)
log.SetFlag(0)
log.Fatal(err)
//🚗Testing(_test.go)
func Test(t *testing.T)
t.Errorf(``)
```

#### Module

```go
//🚗Dev/Pub
```

```go
//🚗Version
```

```go
//🚗Manage
```



