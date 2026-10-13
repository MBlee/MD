## Setup

> **InstallationMode(Per/All) + Backend**
>
> **Doker Desktop + Docker Engine**

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

