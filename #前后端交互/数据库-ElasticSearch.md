#### ElasticSearch

```shell
POST student/_create/1
{
	'name':'lee'
}
```

```ts
const els = require('elasticsearch')
const client = new els.Client({
    host:'localhost:90',log:'trace'
})
client.ping({requestTimeout:1000},err=>{})
client.create({index,type,...}).then(res=>{})
```

#### 