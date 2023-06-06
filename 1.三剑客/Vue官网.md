# VUE2

## 教程

### 安装

- 编译器 + 运行时版，vue.esm.js

- 运行时版，vue.runtime.esm.js

  - resolve.alias

    'vue$': 'vue/dist/vue.esm.js'

~~~shell
# CDN
- <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14"></script>
- <script type="module">
  import Vue from 'https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.esm.browser.js'
</script>
# NPM
- npm install vue
# CLI
~~~

# VUE3

## 教程

### 安装

```shell
# CDN
- <script src="https://unpkg.com/vue@next"></script>
# NPM
- npm install vue@next
- npm install -D @vue/compiler-sfc
# CLI
```