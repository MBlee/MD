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

## Fundamental

#### Structure(Build)

> 1. ISR
> 2. Instrumentation
> 3. PackageBunding, Lighthouse, UseReportWebVitals

```ts
// ISR
// RouteSegment
- dynamicParams
- generateStaticParams
- revalidate
// Function
- revalidatePath
- revalidateTag
```

```ts
// PackageBunding
// npm: @next/bundle-analyzer
// ANALYZE=true pnpm build
require('@next/bundle-analyzer')({
	enabled:process.env.ANALYZE === 'true'
})(nextConfig)
// next.config.ts
- experimental.optimizePackageImports:['lib']
- serverExternalPackages:['lib']
```

```ts
// 1. instrumentation-client.ts
- window:error => reportError(event.error)
```

```ts
// 2. _components/Webvitals.ts
- useReportWebVitals: metric=> report(metric)
	metric.name|value|id
- app => <Webvitals/>
```

```ts
// Instrumentation
// instrumentation.ts
import { registerOTel } from '@vercel/otel'
export function register() {
  if (process.env.NEXT_RUNTIME === 'nodejs') {
    await import('./instrumentation-node')
  }
  if (process.env.NEXT_RUNTIME === 'edge') {
    await import('./instrumentation-edge')
  }
  registerOTel('next-app')
}
```

#### *OpenTelemetry

#### *ThirdParty

#### Structure(Dev)

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

#### Configuration

> next@15

```ts
// next.config.ts
module.exports ={
	alloweDevOrigins:['local-origin.dev','*.lcoal-origin.dev'],
	assetPrefix:'https://cdn.mydomain.com',
    authInterrupts:true,
    basePath:'/html',
    compress:false,
    crossOrigin:'anonymous'
}
```

```ts
- experimental.dynamicIO // use cache/cacheTag/cacheLife
- experimental.serverActions.allowedOrigins
```

```shell
# ts
- experimental.typedRoutes
- typescript.ignoreBuildErrors
```

#### Cli

```shell
next dev
next build
next start
```

## Debug

```shell
# VSCode(launch.json)
- sever: command
- client: url
- fullStack: debugWithChrome
```

```shell
# Chrome(chrome://inspect)
- cross-env NODE_OPTIONS='--inspect' next dev
```

#### ~Cypress

#### ~Jest

#### ~Playwright

#### ~Vitest

## ...

## Backlog

### Structure

#### ~DevEnvironment

#### ~CIBuildCaching

#### ~Memory

#### ~MultiTenant

#### ~MultiZones

#### ~Production

#### ^CICache

```ts
// CI Caching
- .next/cache
```

#### ~CLI

#### *MDX

#### *PWAs