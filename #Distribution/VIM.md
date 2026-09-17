
```shell
# 输入模式
i|a|o|r
# 底线命令=> ESC :
q!|q|wq
set nu
set nonu
```

#### 移动

```shell
#🚗Words
1 + SPACE
^$
#🚗Lines
1 + ENTER
gg => 1gg => G
# 移动1页
ctrl + f
ctrl + b
```

#### 复制/粘贴

```shell
#🚗复制/粘贴 ("+)
y1l => y1h => y^$
yygg => yyG => yy1gg
P/p
#🚗删除
1x => 1X
d1l => d1h => d^$
1dd => ddgg => dd1gg => ddG
#🚗重做 (u)
ctrl + r
```

#### 搜索/替换

```shell
# 搜索替换
/word
?word
n
N
```

