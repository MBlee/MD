#### EndOfLine

```shell
#🚗.eslintrc.js (rules)
prettier/prettier:[
  "error",{
    endOfLine:"auto"
  }
]
#🚗settings.json (.vscode)
{
  "editor.codeActionsOnSave": {
    "source.fixAll.eslint": "explicit"
  },  
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.formatOnSave": true,
  "files.eol": "\n"
}
```

```shell
#🚗.gitattributes
* text=auto eol=lf
```

