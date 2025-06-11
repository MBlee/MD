## Vitals

## Framework

## Dependency

```shell
npm i jest -D
jest  --notify --config=config.json
```

```shell
# 基础配置
npm init jest
```

#### Babel

```shell
npm i -D babel-jest @babel/core @babel/preset-env
```

```ts
// babel.config.js
module.exports = {
  presets: [['@babel/preset-env', {targets: {node: 'current'}}]],
};s
```

