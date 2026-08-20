## ATR

#### FILE

```python
# FILE
open(path,mode[rwax/tb])
f.close()
f.read(5)
f.readline()
with open as f:
for s in f
f.write(content)
import os
os.path.exists(path)
os.remove(path)
os.rmdir(path)
```

#### DT

```python
# class
class Cls(parent): super()
class Inner(self,cls)
def __init__(self,...)
def __str__(self)
def method(self)
del Cls.xx
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
is not
not in
not and or
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
datetime.now
datetime(y,m,d)
d.strftime("%A%B%d")
# math
math.sqrt
math.ceil/floor/pi
# json
json.loads('jstr')
json.dumps(x,indent=4,sort_keys=True)
# re
re.search(r"reg",str)
re.findall(r"reg",str)
re.split(r"\s",s,count)
re.sub(r"reg","replace",s,count)
r.span()
r.group()
```

```python
# try
try: 
except NameError:
else: finally:
raise: Exception("") TypeError("")
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

#### PIP

```shell
pip install/uninstall
pip list
```

```shell
# venv
python -m venv xxx
xxx\Scripts\activate
deactivate
```