## 组件库

```shell
# package.json
- module:'src/index.ts'
- peerdependencies
```

```shell
# 封装必备
- prop-types || defaultProps
- style || class
- export {a as b}
```

## Monorepo

```shell
- workspaces: ['packageA',...]
- npm -ws install
```

## Storybook

```shell
npx storybook@latest init
npm run storybook
```
```ts
// .stories.ts
export const meta = {component}
export const story1 = {args} 
```



