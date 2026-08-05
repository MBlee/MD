## Essential

#### FILE

```python
# FILE
open(path,mode[rwax/tb])
f.close()
with open as f:
f.read(5)
f.readline()
f.write(content)
import os
os.path.exists(path)
os.remove(path)
os.rmdir(path)
```

#### DataType

```python
# class
class cls(parent): super()
class Inner(self,cls)
def __init__(self,...)
def __str__(self)
def method(self)
del xx.xx
```

```python
#🚗str
- for in
- in/not in
- len()
- [s:e]
- replace(a,b)/split(,)/upper/lower/strip
- f"{a:.2f}{a:,}"
- str.format(0,1) => "{0}"
- str.format(a=...) => "{a}"
- input("prompt")
```

```python
#🚗list
- insert(i,val)/append(val)
- extend(list/tuple)
- remove(val)/pop(i)/del list[i]/list/clear
- sort(reverse=True)
- sort(key=fn/str.lower)
- reverse()
- ls[:]/copy()/list(ls)
#🚗tuple
- del tup
- (x,*y,z)=tuple
#🚗set
- add/remove/discard/pop/clear/del
- update(set)
- union(list,tuple)|
- intersection&/intersection_update
- difference-/difference_update
- symmetric_difference^/symmetric_difference_update
- frozenset
#🚗dict
- dict(a=*,...)
- keys/values/get/items
- update(dict)
- pop/popitem/del/clear
- copy/dict
#🚗range
- list(range(start,stop,step)[s:e])
#🚗iterator
- iter(it)
- next(it)
- raise StopIteration
```

```python
# Condition(pass)
if elif else:
A if else B
not and or
is not
not in
match: case a|b _ if:
# Iterable(else)
while: break continue
for in range(len()):
[print(i) for i in list] 
[i for in if in]
# func
def fn(/,*,a=default,*args,**kwargs)
global nonlocal
# decorator
@decor()=>def fn()=> fn(*a,**ka)
@functools.wraps(func)
__name__ __doc__
# lambda
lambda *args:exps
list(map(lambda,ls))
list(filter(lambda,ls))
sorted(ls,key=lambda)
sys.getrecursionlimit
# gen
gen=(x*x for x in range(6))
arg = yield ret
next(gen)
gen.send(data)
gen.close()
# modules
from md import platform as
dir(md)
```

```python
# datetime
import datetime
datetime.now
datetime(y,m,d)
d.year
d.strftime("%A")
# math
import math
math.sqrt
math.ceil/floor/pi
# json
import json
json.loads('jstr')
json.dumps(x,indent=4,sort_keys=True)
# re
import re
re.search("reg",target)
re.findall("reg",target)
re.split("\s",target,1)
re.sub("reg","replace",target,2)
r.span()
r.group()
r.string
```

```python
# try
try: except NameError:
else: finally:
raise: Exception("") TypeError("")
```

```python
# venv
python -m venv xxx
xxx\Scripts\activate
deactivate
```

```python
#🚗🚗🚗Type
- int/float/complex
- str/bool/None
- list/tuple/range
type(x)
isinstance(x,int)
int()
id()
```

