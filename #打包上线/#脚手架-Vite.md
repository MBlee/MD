```shell
#! 安装
npm create vite -- --template vue-ts <app>
```

#### 全局配置

```markdown
# 路径配置
- base  =>  import.meta.env.BASE_URL
- resolve.alias|extensions  => baseUrl & paths
# 环境变量
- envDir  =>  import.meta.env.VITE
```

```markdown
# 合并配置
```

#### 本地服务器

```markdown
- server
# 拦截器
# HTTPS服务器
1. npm i mkcert -g
- mkcert create-ca
- mkcert create-cert --domain localhost
- https:{
	cert:fs.readFileSync
	key:fs.readFileSync
}
2. npm i @vite/plugin-basic-ssl -D
- plugins:[BasicSSL()]
# 缓存
# SourceMap
```

#### 模块

```markdown
- rollupOptions
# 模块依赖
- css.preprocessorOptions.scss.additionalData:
  '@import "@/global.scss"'
# 外部依赖
# 资源模块
```

```markdown
# 输入输出
# 打包优化
# 插件
```

```shell
# 预构建 =>	1.转换ESModule	2.统一导出
- .vite/deps  =>  optimizeDeps.excludes
```

#### ......

#### vue

#### react
