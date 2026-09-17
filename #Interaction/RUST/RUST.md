## Chief

## Artery

```rust
use std::io
fn main(){
  println!("{}",x);
  print!("{:?}",arr);
}
```

#### File

#### DataType

```rust
let mut x=0
const S:&str = "String"
i32/f64/bool/char/&str
let str=String::from("")
let str="".to_string()
format!("{}",str)
str.push_str("")
let str1=str.clone()
let str1=&mut str
let str1=&str
let str1=&str
let str1=&str[..]
{str=>drop}
str.clear()
```

```rust
let mut arr:[int;len] = [val;rep]
let mut v = vec!["",...]
let tup:(i32,f64) = (...) => tup.0 => (,)
let mut hMap = HashMap::new()
arr.len() => arr[]=x
v.push/pop/remove(i)
v.insert(i,"")
hMap.insert(k,v)
hMap.remove(k)
hMap.get(k)
struct P{,} => P{..P1,..P2} => p.x
struct T(,) => T(,) => t.0
enum E{,} => E::X
enum EV{V1(),V2()} => EV::V1() => V1(msg)=>msg
```

```rust
if{""}else{""}
match{1|2|3=>"",_=>""}
for i in (1..=9).rev(){}
loop{break "";}
while{continue;}
fn f(a:i32,b:f64)->(i32,f64){(,)}
```

```rust
use std::io
io::stdin().read_line(&mut str).expect();
```

#### Concept

```shell
#🚗Ownership
Copy:i32/f64/bool/&str
Move:String,Struct,Tuple...{init=>Drop}
#🚗Reference
fn f(&mut m) => f(&mut m)
```