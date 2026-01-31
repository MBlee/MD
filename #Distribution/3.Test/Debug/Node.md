## Shell

```shell
node --inspect-brk "$(where <cmd>)" args...
```

## Sevice

## ......

```shell
### CHROME
node --inspect-brk 
-r tsx
<binPath> args...
```

```shell
### VSCODE
# launch.json
runtimeExecutable:"npx"
runtimeArgs:["ts-node","src/index.ts"]
```

