## TS

## Babel

## ESlint

```shell
# 自动配置
npm init @eslint/config -- --config eslint-config-xo
# 手动配置
npm i eslint @eslint/js globals -D
# 执行检查
npx eslint <file>
npx --node-options='--experimental-strip-types' eslint --flag unstable_native_nodejs_ts_config #TS支持（jiti）
```

```shell
# CLI-API
# 修复
--fix, --fix-dry-run
--fix-type: [problem,suggestion,layout,directive]
# 警告
--quiet
# 输出
--output-file
--format(eslint-formatter-)
```

```ts
// Eslint9（eslint.config.js）
import {defineConfig} from 'eslint/config'
import js from '@eslint/js'
import globals from "globals";
export default defineConfig([
  {
    files:["**/*.{js,cjs,mjs}"],
    languageOptions:{
      globals:globals.browser
    },
    plugins:{js},
    extends:["js/recommended"],
    rules:{
      "no-unused-vars":"warn",
      "no-undef":"error"
    }
  }
])
```

```json
// ESLint8及以下（.eslintrc.json）
// eslint-config-airbnb-base eslint-plugin-import
{
  "extends": "airbnb-base",
  "rules": {
    // 在这里覆盖或添加额外的规则
    "no-unused-vars":"warn",
    "linebreak-style": ["error", "windows"]
  },
  "env": {
    "browser": true,
    "node": true,
    "es6": true
  },
  "parserOptions": {
    "ecmaVersion": 2020,
    "sourceType": "module"
  }
}
```

```ts
// 通用配置
{
	files,ignores:["**/*.ts","**/!(*.*)"],
	rules,
    extends:[shareConfig,'plugin/config'],
    plugins,
      
    settings,
    languageOptions:{
      ecmaVersion,sourceType,
      globals
	}
}
```

```ts
// npm: @eslint/eslintrc
import { FlatCompat } from "@eslint/eslintrc";
const compat = new FlatCompat({baseDirectory})
export default [...compat.extends('...')]
```

```ts
// npm: @eslint/js
// npm: globals
- js.configs.recommended
- globals.browser
// npm: typescript-eslint
- tslint.config()
```

```ts
// npm: eslint-plugin-react-hooks
// npm: eslint-plugin-react-refresh
- ...reactHooks.configs.recommended.rules
- 'react-refresh/only-export-components': [
  'warn',
  { allowConstantExport: true },
]
- plugins.reactHooks
- plugins.reactRefresh
```

#### Rules

```shell
# EmptyObject
- @typescript-eslint/no-empty-object-type: "off"
- no-empty-pattern: "off"
# Prettier
- prettier/prettier: [ "error",{"endOfLine": "auto"}] #EOL
```

## Prettier