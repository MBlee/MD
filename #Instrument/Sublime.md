预览HTML：build > cmd:explorer.exe, $file

## 快捷键

合并行：ctrl+j

删除行：ctrl+x

复制行：ctrl+shift+D

插入行：ctrl+enter

多选单词：ctrl+D

全选单词：alt+F3

#### Snippets

```shell
# 变量
$TM_FILENAME => ${1:}
${name/reg/replace/i}
```

## 常用插件安装

**代码提示**

~~~shell
# SublimeText-Nodejs
1. 文件名改为Nodejs
2. 文件Nodejs.sublime-build，
"encoding": "cp1252" 改 
"encoding": "utf8" ，
"cmd": ["taskkill /F /IM node.exe & node", "$file"] 改 
"cmd": ["node", "$file"]
3. 文件“Nodejs.sublime-settings”，
"node_command": false 改 
"node_command": "D:\\Program Files\\nodejs\\node.exe" ，
"npm_command": false 改 
"npm_command": "D:\\Program Files\\nodejs\\npm.cmd" 
# React ES6 Snippets
# sublime-jsfmt
{
    "keys": ["ctrl+q"],
    "command": "format_javascript"
}
~~~

~~~shell
# sublimecodeintel
~~~

~~~shell
# sublimeServer
# browserFresh
~~~

~~~shell
# emmet
{
    "keys": ["tab"],
    "command": "expand_abbreviation_by_tab",

    // put comma-separated syntax selectors for which 
    // you want to expandEmmet abbreviations into "operand" key 
    // instead of SCOPE_SELECTOR.
    // Examples: source.js, text.html - source
    "context": [{
            "operand": "source.js",
            "operator": "equal",
            "match_all": true,
            "key": "selector"
        },

        // run only if there's no selected text
        {
            "match_all": true,
            "key": "selection_empty"
        },

        // don't work if there are active tabstops
        {
            "operator": "equal",
            "operand": false,
            "match_all": true,
            "key": "has_next_field"
        },

        // don't work if completion popup is visible and you
        // want to insert completion with Tab. If you want to
        // expand Emmet with Tab even if popup is visible -- 
        // remove this section
        {
            "operand": false,
            "operator": "equal",
            "match_all": true,
            "key": "auto_complete_visible"
        }, {
            "match_all": true,
            "key": "is_abbreviation"
        }
    ]
}
~~~



**代码跳转**



## Errors

##### CMD默认打开两个窗口

> 在User Setting 当中添加："hot_exit": false, "remember_open_files": false