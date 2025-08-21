## Webpack

## Scaffold

### Vite

```shell
# npm: @vitejs/plugin-react @vitejs/plugin-react-swc
# (ts/eslint)
npm create vite@latest my-app -- --template react-ts
```

### Next

```shell
# npm: next react react-dom
```

### Cra

```shell
# npm: create-react-app @craco/craco @craco/types
npx create-react-app --tempalte typescript
```

> 1. craco.config.js
> 2. tsconfig.paths.json
> 3. emotion, postcss

```ts
// craco.config.js
// webpack...
- alias
- configure.resolve.extensions
```

```typescript
// tsconfig.paths.json
- compilerOptions.baseUrl
- compilerOptions.paths
```