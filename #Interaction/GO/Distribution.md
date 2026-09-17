## Build

```shell
go list -f '{{.Target}}'
go env -w GOBIN=xxx
(GOROOT/GOPATH/GOBIN/GOCACHE)
```

```bash
go mod init exp/<pkg>
go mod edit -replace xx=xx
go mod tidy
go test -v
go run
go build -o xxx
go install xxx@xxx
go clean -cache
```

## Publish

## PRESET

```bash
#🚗PKG_PROXY_IMAGE
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
(https://aliyun.com)
go env GOPROXY
#🚗Win
set GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
go env GOPROXY
```

