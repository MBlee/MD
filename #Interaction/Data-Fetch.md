#### Fetch

```js
// 基于promise
fetch(url,{
  method:"post",
  body:"user=lee&...",
  headers:{
    "Content-Type":"application/x-www...."
  },
  mode:"cors",
  credentials:"include"
}).then{(res)=>{
  if(res.ok) 
  res.json()
  res.text()
  res.formData()
  res.blob()
  res.arrayBuffer()
  else throw res.status
}}.then(data=>).catch(err=>)
```

```js
// 封装
async function http(obj){
  let {method,url,params,data}=obj,res
  if(params){
    let str = new URLSearchParams(params).toString()
    url += '?'+str
  }
  if(data){
    res = await fetch(url,{method,headers:{"Content-Type":'application/json'},body:JSON.stringify(data)})
  }else{
    res = await fetch(url)
  }
  return res.json()
}
```