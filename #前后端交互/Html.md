### HTTP-Header

**Content-Type:**

- text/plain
- application/json
  - JSON.stringfy( xxxobj )
- application/x-www-form-urlencoded
  - a=xxx&b=xxx
- multipart/form-data

**Autorization:**

- localStorage.getItem("token")

### HTTP-Response

Access-Control-Allow-Origin

**Access-Control-Allow-Headers**

**Access-Control-Allow-Methods**

### HTTP-配置

**timeout**

**headers['Content-Type']，withCredentials**

**transformRequest：**

- qs.stringfy(data)

**request拦截器:**

- req.headers.Autorization = token

**response拦截器:**

- res.data
- err, { res }
  - res.status
  - window.navigator.onLine

