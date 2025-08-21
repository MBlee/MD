## 参数

事件戳：{{$[timestamp]()}}

随机数：{{$[randomint]()}}

GUID：{{$[guid]()}}

环境变量：{{xxx}}

## 断言

[responseBody]()

[responseCode.code]()

[pm.environment]()

[pm.globals]()

- set('','')
- get('')
- unset('')

[pm.response]()

- to.have.status(200)

~~~js
// 设置环境变量
- pm.environment.set('token','')
// 断言
- pm.test('',function(){})
- tests['']=(==)
~~~

