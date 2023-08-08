# Bootstrap

### 布局：

```shell
# 布局类
- container|container-fluid
- col
- offset
- push|pull
# 水平|垂直
justify-content|items-(start)
# width|height
- row|col
# margin|padding
- ml|mx-(em)
- pl|px-(em)
```

~~~shell
# 背景
- bg-(info)
# 文字
- text-(info)
- text-left|right|center|justify
- font-weight-(normal)
~~~

### 常用样式：

~~~shell
# 标题 
- .h1~h6|small
# 强调
- .lead|b|strong|i|em
- .text-muted|primary|success|info|warning|danger
# 代码
- code|kbd|pre
# 列表
- .list-unstyled|inline
# 表格
- table => 
.table|table-bordered|table-striped|table-hover|table-condensed
- tr =>
.info|success|active
# 表单
- .form-control|input-lg|input-sm
- select => multiple='multiple'
- div => .checkbox|radio
- btn|a => disabled='disabled'
.btn|btn-primary|btn-lg
- form => role='form'
.form-horizontal|form-inline
- form>div => .form-group
- label => .control-label|checkbox-inline|radio-inline
# 缩略图
- .thumbnail
# 面板
- .panel|panel-default
- .panel-heading
- .panel-body
~~~

~~~shell
# 导航
- navbar|navbar-light
- nav-item|nav-link
- ul|ol =>
.nav|nav-tabs|nav-pills|nav-stacked|nav-justified
# 面包屑
- breadcrumb|breadcrumb-item
- .pagination 
- .pager
# 表单
- form-group
- form-control|is-valid
- form-control-file
- form-control-range
- form-check-input|-label
- form-text|text-muted
- noValidate
- is-invalid
- invalid-feedback
# 下拉菜单
- div => .dropdown|btn-group
- button => data-toggle='dropdown'
.dropdown-toggle
- span => .caret
- ul => .dropdown-menu
- li => .divider|.dropdown-header
- .dropdown-menu-left|right
- .active|.disabled
# 模态框
- button => 
data-toggle='modal',data-target='#id'
- $(#id).modal('show|hide')
~~~



### 全局样式：

Form:

- form-inline/horizontal
- form-group/has-warning-feedback
- form-control/form-control-feedback

Button:  type

- btn/primary/success
- btn-lg
- btn-group/btn-toolbar
- btn-group-sm/justified/vertical/

Span

- caret
- text-hide

Img:

- img-responsive
- img-circle/rounded/thumbnail