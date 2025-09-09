## Establishing

```ts
// Node Server (Custom Server/Configure)
- Image
- Cache/ISR
- BuildCache
- CDN
- Streaming
- Middleware (Edge/Node)
- ENV (NEXT_PUBLIC)
```

```ts
// Static (output/distDir)
- Image
- Route (GET)
- Dynamic (Error)
// SPAs
```

```ts
// Docker
```

```ts
// Adapters
```

## Structure

> 1. package.json, turbopack
> 2. tsconfig.json, next-env.d.ts, next.config.ts
> 3. eslint.config.mjs
> 4. postcss.config.mjs

> - chakra-UI
> - bootstrap
> - headless-UI
> - emotion
> - motion
> - @reduxjs/toolkit
> - mobx
> - @tanstack/react-query
> - loadash

```shell
# package.json
- npm: next react react-dom
- npm: typescript  @types/node  @types/react @types/react-dom
- scripts: next
```

```shell
# tsconfig.json
- plugins
# next-env.d.ts 
- npx next
# next.config.ts
- experimental.typedRoutes
- typescript.ignoreBuildErrors
```

```shell
# eslint
- npm: eslint  eslint-config-next  @eslint/eslintrc
# eslint.config.mjs
...new FlatCompat({baseDirectory}).extends(['next/core-web-vitals','next/typescript'])
```

```shell
# tailwindcss
- npm: tailwindcss @tailwindcss/postcss
- plugins:['@tailwindcss/postcss']
```

## Cli

```shell
next dev
next build
next start
```

