## START

#### 封装：

```js
const http = axios.create()
http.defaults.baseURL = 'http://...'
http.defaults.headers['Content-Type'] = 'multipart/form-data';
http.defaults.transformRequest = (data,headers)=>{
    if (headers['Content-Type'] === 'application/x-www-form-urlencoded')
        return Qs.stringify(data)
    return data
}
http.interceptors.response.use(res=>{
    return res.data
},err=> return Promise.reject(err))
```

~~~js
// 基本配置
1.axios.create({baseURL,timeout})

axios.defaults.withCredentials = true;
axios.defaults.headers['Content-Type'] = 'application/x-www-form-urlencoded';
axios.defaults.transformRequest = data => qs.stringify(data);

// 请求拦截器
2.axios.interceptors.request.use(fn)
config => token&&(config.headers.Authorization = token)
error=>Promise.reject(error)

// 响应拦截器
3.axios.interceptors.response.use(fn)
response => return response.data
error => let {response} = error   if(response.status)else{if(!window.navigator.online)}

4. cancelToken: new axios.CancelToken((cancel))
~~~

#### API封装：

api.js > api-1.js，api-2.js

Vue.prototype.$api = api

**Axios方法集：**

axios({ method: 'get', url: 'http...', data: xxxobj }).then(response=>)

axios.request()

axios.get|post()

**响应对象：**

config|data|headers|request

status|statusText

**请求对象：**

url|baseURL|method

transformRequest|Response

headers，params

responseType，proxy

默认配置：

axios.defaults.method

axios.defaults.baseURL

axios.defaults.params

axios.defaults.timeout

## JSON Server

安装：npm i -g  json-server

创建JSON：db.json

开启服务：json-server --watch db.json --deley 2000



##### 特点：

基于promise的异步ajax请求库

支持请求、响应拦截器

支持请求取消

请求、响应数据转换

批量发送请求
