## Setup

> **InstallationMode(Per/All) + Backend**
>
> **Doker Desktop + Docker Engine**

```shell
# %UserProfile% > .wslconfig
[wsl2]
memory=4GB          # 限制 WSL 2 最多只能使用 4GB 内存（你可以根据你的总内存自行调整，比如 4G/8G）
processors=4        # 限制分配的 CPU 核心数
swap=2GB            # 限制交换分区大小
# Restart
wsl --shutdown
```



#### Docker Desktop

```shell
"Docker Desktop Installer.exe" install --user
```

```shell
docker version
docker info
docker run --rm hello-world
docker ps -a
```

```shell
docker run -d --name my-nginx -p 8080:80 nginx
docker ps
docker logs my-nginx
docker stop my-nginx
docker start my-nginx
docker rm -f my-nginx
docker images
```

#### WSL2/Hyper-V

> Resources > WSL Integration

```shell
wsl --version
wsl --install
wsl --update
wsl -l -v
wsl --list --online
wsl --install <Distro>
```

```shell
wsl --install -d Ubuntu-24.04
wsl --install --web-download -d Ubuntu-24.04
wsl --set-version Ubuntu-24.04 2
wsl --set-default Ubuntu-24.04
wsl -d ...
wsl --terminate Ubuntu-24.04
wsl --shutdown
whoami
pwd
uname -r
cat /etc/os-release
```

