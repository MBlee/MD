## BASE

```shell
1.输入账号密码(F)
2.查询数据库>验证密码(B)
3.Token生成>返回(B)
4.Token保存>携带(F)
5.Token验证>AccessAPI(B)
```

```ts
//🚗🚗🚗Express(jsonwebtoken/bcryptjs/cors)
bcrypt.hashSync => bcrypt.compareSync
jwt.sign(user,SECRET,{expiresIn})
jwt.verify(token,SECRET) => req.user=decoded
//🚗🚗🚗React()
localstorage.setItem/getItem()
headers.Authorization='Bearer Token'
```