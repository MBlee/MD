## Build

```bash
go mod init example/<pkg>
go mod tidy
go run .
go build .
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

