## Git

#### git无法克隆

```shell
# 查询是否使用代理：git config --global http.proxy
# 取消代理：git config --global --unset http.proxy
```
#### git无法下载

~~~shell
# 修改端口号
# cd ~/.ssh => vim config => ssh -T git@github.com
Host github.com
User git
Hostname ssh.github.com
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa
Port 443

Host gitlab.com
Hostname altssh.gitlab.com
User git
Port 443
PreferredAuthentications publickey
IdentityFile ~/.ssh/id_rsa
~~~

~~~shell
# 多密钥登录
1. ssh-agent bash
2. ssh-add ~/.ssh/id_rsa_xxx
~~~
#### git不时登录验证

~~~shell
git config --global credential.helper store
git credential-manager uninstall
~~~

## Webpack

#### 本地JSON读取

> Public目录 => '/.json'

#### Eject无法运行

"scripts": {

    "start": "node scripts/start.js",
    "build": "node scripts/build.js",
    "test": "node scripts/test.js"
  }