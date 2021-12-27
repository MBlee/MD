### 安装

~~~shell
# mockjs产生模拟数据
cnpm i mockjs -S
# json5解决json无法添加注释问题
cnpm i json5 -S
~~~

### 使用

Mock.mock('@id')

- @id|@cname|@date|@ip|@email
- @paragraph
- @image('200*200', 'red', '#fff', 'avatar')

json5

- JSON5.parse(json)

devServer

- before: function(app, server, compiler){

  ​	app.get('/some/path', function(req, res){

  ​		getJsonFile('...json5')

  ​		res.json(Mock.mock(json))

  ​	})

  }

移除Mock

- if(process.env.MOCK == 'true')

- .env.development

  MOCK=true

流程：

1. if MOCK=='true'
2. before=> app.get()
3. getJsonFile=> res.json(Mock.mock(json))