## Setup

```shell
docker run 
	-d -p 6379:6379  --name redis 
	redis:latest
```

```shell
docker exec -it 
	redis redis-cli
```

