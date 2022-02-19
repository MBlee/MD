### ElementUI

```shell
# 安装引用 npm i element-ui -S
import ElementUI
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI)
# 按需引入 npm i babel-plugin-component -D
# babel.config.js
# presets:[['@babel/preset-env',{'modules':false}]]
# 'plugins':[
  ['component',{'libraryName':'element-ui',
    'styleLibraryName':['theme-chalk']}]
]
import {Button,Select}
Vue.component(Button.name,Button)
```
