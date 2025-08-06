## Emotion

```shell
npm: @emotion/react @emotion/styled @emotion/babel-preset-css-prop
npm: @emotion/babel-plugin
npm: @emotion/css
```

```shell
# .babelrc
- presets:['@emotion/babel-preset-css-prop']
# tsconfig.json
- jsxImportSource: "@emotion/react"
```

## Tailwindcss

#### Craco

```shell
npm i -D tailwindcss@npm:@tailwindcss/postcss7-compat postcss@^7 autoprefixer@^9
```

```ts
// craco.config.js
- style.postcss.plugins:[require('tailwindcss'),require('autoprefixer')]
// base.css
@import 'tailwindcss';
```

