## EJS

```ts
// Render
ejs.compile(str,options) => template(data)
ejs.render(str,data,options)
ejs.renderFile(filename,data,options,(err,str)=>{})
// ExpressRender
app.set('view engine','ejs')
app.set('view options',opts)
res.render('index',data)
```

```ts
// RenderOptions
- views
- async
```

## Template

```shell
- <%_
- <%=
- <%-
- <%#
- <%%
- <%- include('file',data); %>
- <% include file.ejs %>
```

