## Vitals

```ts
// GLOBAL
- describe/test/only
- beforeEach/afterEach/beforeAll/afterAll
// ASSERT
- expect
- not.toBe
- toBeNull/Undefined/Defined/Truthy/Falsy
- toBeGreeterThan/LessThan
- toMatch
- toContain
- toThrow
```

## Framework

#### Next

```shell
npm: jest jest-environment-jsdom 
npm: @testing-library/react @testing-library/dom @testing-library/jest-dom 
npm: ts-node @types/jest
npm init jest
```

```ts
// jest.config.ts
import type { Config } from 'jest'
import nextJest from 'next/jest.js'
const createJestConfig = nextJest({
  dir: './',
})
const config: Config = {
  coverageProvider: 'v8',
  testEnvironment: 'jsdom',
  // setupFilesAfterEnv: ['<rootDir>/jest.setup.ts'],
}
export default createJestConfig(config)
```

## Start

```shell
npm: jest
npm init jest
jest  --notify --config=config.json
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

