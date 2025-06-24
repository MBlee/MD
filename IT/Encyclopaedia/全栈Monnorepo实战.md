## Monorepo项目构建

### PNPM

```shell
## 重复依赖>.pnpm-store, 幻影依赖>.pnpm
```

```shell
# pnpm-workspace.yaml
packages:
	- "!pkg/**"
# package.json
deps:"workspace:*"
# pnpm cli
pnpm i -wD
pnpm i --filter
```

### TS

```json
// tsconfig.json
extends:"@/tsconfig"
```

```json
// .eslintrc.json
extends:"@/eslint-config"
```

## Deno构建注册中心

### API版本

```shell
# url
- /v1/v2
# headers
- Accept=application/registry-1
```

## 函数服务实现

## Prisma构建数据模型

## Fastify服务器设计

## 用户管理服务

## 活动管理服务

## 报名登记前端

## 报名登记页面设计

## 项目部署监控高可用

## 开源项目Monorepo实践