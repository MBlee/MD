```shell
# Rollup:  1.ES6Module  2.Tree-shaking
npm install --global rollup || yarn add rollup --dev
rollup -c xxx
```

```shell
# 浏览器
rollup main.js --file bundle --format iife
# Node.js
rollup main.js --file bundle.js --format cjs
# 浏览器+Node.js
rollup main.js --file bundle.js --format umd --name 'myBundle'
```

## 打包配置

```shell
# rollup.config.js >>>  yarn rollup --config
- input
- output > file,format
- plugins
```

## 插件

```shell
# Json解析插件
npm i -D rollup-plugin-json
rollup.config.js > plugins > [json()]
```


#### 