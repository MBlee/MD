## Structure

> pnpm-workspace.yaml, package.json
>
> apps/, packages/, scripts/

```shell
#🚗pnpm-workspace.yaml
packages:
 - 'apps/*'
 - 'packages/*'
```

```shell
#🚗package.json (pkg@workspace:*)
#🚗Eslint/Prettier/Ts/Vitest
```

## CLI

> deps + scripts + build + version

```shell
#🚗Deps
-w | --filter <pkg@workspace:*^>
#🚗Scripts
dev:'pnpm --parallel run dev'
```

```shell
#🚗Publish
pnpm publish -r
#🚗Versions
pnpm add @changesets/cli -w
npx changeset init
```

## Toolchain

> Turborepo + Nx + (Changesets + GitHub Actions)

## ......

## App/Lib

## Optimization

## CICD



