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
# str
- for in
- in/not in
- len()
- [s:e]
- upper/lower
- strip
- replace(a,b)
- split(,)
- f"{a:.2f}{a:,}"
- str.format(0,1) => "{0}"
- str.format(a=...) => "{a}"
- input("prompt")
```

```python
# list
- insert(i,val)
- append(val)
- extend(list/tuple)
- remove(val)
- pop(i)
- clear
- del list[i]/list
- [xExp if else for in if in]
- reverse()
- sort(reverse=True)
- sort(key=fn)
- ls[:]/copy()/list(ls)
# tuple
- tuple(list(tuple))
- (x,*y,z)=tuple
- +*
# set
- add/remove/discard/pop/clear
- update(set)
- del
- union|
- intersection&/intersection_update
- difference-/difference_update
- symmetirc_difference^/symmetric_difference_update
- frozenset
# dict
- dict(a=*,...)
- keys/values/get/items
- update(dict)
- pop/popitem/del/clear
- copy/dict
# range
- list(range(start,stop,step)[s,e])
```

```python
if elif else:
A if else B
not and or
match: case a|b _ if:
while: break continue
for in range(len()):
else:
```

```python
# func
def fn(*,a=default,/,*args,**kwargs)
global nonlocal
@decor()=>def(fn)=>fn
__name__ __doc__
@functools.wraps(func)
lambda *args:exps
list(map(lambda,ls))
list(filter(lambda,ls))
sorted(ls,key=lambda)
sys.getrecursionlimit
# gen
yield=>next(gen)
gen.send(data)
gen.close()
# iter
__next__ __iter__
raise StopIteration
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

