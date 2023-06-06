# Git

- git无法克隆

  ```shell
  # 查询是否使用代理：git config --global http.proxy
  # 取消代理：git config --global --unset http.proxy
  ```

- git无法下载

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


